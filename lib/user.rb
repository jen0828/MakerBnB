require_relative 'db_connection'
require 'bcrypt'

class User < DbConnect 
	include BCrypt

	attr_reader :id, :name, :email

	def initialize(id:, name:, email:, password:)
		@id = id
		@name = name
		@email = email
		@encrypted_password = password
	end

	def password
		password ||= Password.new(@encrypted_password)
	end
	
	def self.create(name:, email:, password:)
		password_hash = BCrypt::Password.create(password)
		connection = DbConnect.new.connect

		result = connection.query("INSERT INTO guest (name, email, password) VALUES ('#{name}', '#{email}', '#{password_hash}') RETURNING id, name, email, password;")
		result.map do |row|
			new(id: row['id'], name: row['name'], email: row['email'], password: row['password'])
		end.first
	end

	def self.find(id)
		return nil unless id
		
		connection = DbConnect.new.connect
		
		result = connection.query("SELECT * FROM guest WHERE id = '#{id}';")		
		result.map do |row|
			new(id: row['id'], name: row['name'], email: row['email'], password: row['password'])
		end.first
	end

	def self.find_by(email)
		return nil unless email
		
		connection = DbConnect.new.connect
		
		result = connection.query("SELECT * FROM guest WHERE email = '#{email}';")		
		result.map do |row|
			new(id: row['id'], name: row['name'], email: row['email'], password: row['password'])
		end.first
	end

	def self.authenticate(email:, password:)
		user = find_by(email)
		return nil unless user
		return nil unless user.password == password
		user
	end
end