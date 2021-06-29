class User
	attr_reader :name, :email, :password

	def initialize(name, email, password)
		@name = name
		@email = email
		@password = password
	end
	
	def self.create(name:, email:, password:)
		connection = PG.connect(dbname: makersbnb_test)
		result = connection.exec("INSERT INTO user (name, email, password) VALUES ('#{name}', '#{email}', '#{password}') RETURNING name, email, password;")
		User.new(name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
	end
end