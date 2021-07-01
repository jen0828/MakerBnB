require_relative 'db_connection'
require 'bcrypt'

class User < DbConnect 

	attr_reader :id, :name, :email

	def initialize(id:, name:, email:)
		@id = id
		@name = name
		@email = email
	end
	
	def self.create(name:, email:, password:)
		encrypted_password = BCrypt::Password.create(password)
		connection = DbConnect.new.connect

		result = connection.query("INSERT INTO guest (name, email, password) VALUES ('#{name}', '#{email}', '#{encrypted_password}') RETURNING id, name, email;")
		User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
	end

	def self.find(id)
		return nil unless id
		
		connection = DbConnect.new.connect
		
		result = connection.query("SELECT * FROM guest WHERE id = '#{id}';")		
	end

	def self.authenicate(email:, password:)
		result = DbConnect.new.connect.query("SELECT * FROM guest WHERE email = '#{email}'")

		return unless result.any?
		return unless BCrypt::Password.create(result[0]['password']) == password

		User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'])
	end

end