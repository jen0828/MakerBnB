require 'pg'

class Space
  attr_reader :name, :description, :price, :start_date, :finish_date

  def initialize(name:, description:, price:, start_date:, finish_date:)
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @finish_date = finish_date
  end

  def self.create(name:, description:, price:, start_date:, finish_date:)
    if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'makersbnb_test')
		else
			connection = PG.connect(dbname: 'makersbnb')	
		end

    result = connection.exec("INSERT INTO space (name, description, price, start_date, finish_date) VALUES ('#{name}', '#{description}', #{price}, '#{start_date}', '#{finish_date}') RETURNING name, description, price, start_date, finish_date;")
    Space.new(name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], start_date: result[0]['start_date'], finish_date: result[0]['finish_date'])
  end

  def self.listing
    if ENV['ENVIRONMENT'] == 'test'
			connection = PG.connect(dbname: 'makersbnb_test')
		else
			connection = PG.connect(dbname: 'makersbnb')	
		end

    result = connection.exec("SELECT * FROM space LIMIT 6;")
     result.map do |space| 
       Space.new(name: space['name'], description: space['description'], price: space['price'], start_date: space['start_date'], finish_date: space['finish_date'])
     end
  end

end