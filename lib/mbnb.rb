require './lib/space'

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

  def add(user)
  end
  def user

  end
end