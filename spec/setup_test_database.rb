require 'pg'

def setup_test_database

	p "Setting up database..."

	connection = PG.connect(dbname: 'makersbnb_test')

	connection.exec("TRUNCATE space, guest;")
end