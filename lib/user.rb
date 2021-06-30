require_relative 'db_connection'
require 'bcrypt'

class User < DbConnect
	attr_reader :id, :name, :email, :password

	def initialize(id:, name:, email:, password:)
		@id = id
		@name = name
		@email = email
		@password = password
	end
	
	def self.create(name:, email:, password:)
		connection = DbConnect.new.connect

		result = connection.exec("INSERT INTO guest (name, email, password) VALUES ('#{name}', '#{email}', '#{password}') RETURNING id, name, email, password;")
		User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
	end

	def self.find(name)
		connection = DbConnect.new.connect
		
		result = connection.query("SELECT * FROM guest WHERE name = '#{name}';")
		@name = result[0]['name']
	end

	def self.authenicate(email:, password:)
		connection = DbConnect.new.connect

		result = connection.query("SELECT * FROM guest WHERE email = '#{email}'")
		return unless BCrypt::Password.new(result[0]['password']) == password

		User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
	end

end