require_relative 'db_connection'
require './lib/user'

class Space < DbConnect
  attr_reader :id, :name, :description, :price, :start_date, :finish_date, :guest_id

  def initialize(id:, name:, description:, price:, start_date:, finish_date:, guest_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @start_date = start_date
    @finish_date = finish_date
    @guest_id = guest_id
  end

  def self.create(name:, description:, price:, start_date:, finish_date:, guest_id:)
    connection = DbConnect.new.connect
    result = connection.exec("INSERT INTO space (name, description, price, start_date, finish_date, guest_id) VALUES ('#{name}', '#{description}', #{price}, '#{start_date}', '#{finish_date}', '#{guest_id}') RETURNING id, name, description, price, start_date, finish_date, guest_id;")

    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], start_date: result[0]['start_date'], finish_date: result[0]['finish_date'], guest_id: result[0]['guest_id'])
  end


  def self.available(start_date:, finish_date:)
    connection = DbConnect.new.connect
    result = connection.exec("SELECT * FROM space INNER JOIN guest ON space.guest_id = guest.id WHERE start_date <= '#{start_date}' AND finish_date >= '#{finish_date}';")
    @availability = result.map do |space| 
      Space.new(id: space['id'], name: space['name'], description: space['description'], price: space['price'], start_date: space['start_date'], finish_date: space['finish_date'], guest_id: space['guest_name'])
    end
  end

  def self.listing
    connection = DbConnect.new.connect
    result = connection.exec("SELECT * FROM space INNER JOIN guest ON space.guest_id = guest.id ORDER BY guest_id DESC LIMIT 10;")
    result.map do |space| 
      Space.new(id: space['id'], name: space['name'], description: space['description'], price: space['price'], start_date: space['start_date'], finish_date: space['finish_date'], guest_id: space['guest_name'])
    end
  end

  def self.find(user)
    connection = DbConnect.new.connect
    result = connection.exec("SELECT * FROM space INNER JOIN guest ON space.guest_id = #{user};")
    Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'], start_date: result[0]['start_date'], finish_date: result[0]['finish_date'], guest_id: result[0]['guest_name'])
  end

  def self.availability
    @availability
  end
end