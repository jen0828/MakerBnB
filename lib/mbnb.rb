require './lib/space'
require_relative 'user'

class MbNb
  attr_reader :all_spaces

  def initialize
    @all_spaces = []
  end

  def add(space)
    @all_spaces << space

  end

  def spaces
    @all_spaces[0]
  end

  # def find
  #   connection = PG.connect(dbname: 'makersbnb_test')
  #   	result = connection.query("SELECT * FROM guest WHERE name = '#{name}'")
  # end
end