require './lib/space'
require 'mbnb'

describe Space do
  it 'allows a user to create a space' do
    space = Space.new(name: 'hut', description: '3 bed hut', price: '50', start_date: '2020-02-08', finish_date: '2020-02-11')
    bnb = MbNb.new
    bnb.add(space)
    listing = bnb.spaces
    expect(listing.name).to eq 'hut'
  end

  describe '.create' do
    it 'creates a new space' do
      connection = PG.connect(dbname: 'makersbnb_test')
      space = Space.create(name: "House", price: 50, start_date: 2021-06-03 , finish_date: 2021-06-04)

      expect(space.name).to eq('House')
      expect(space.prie).to eq(50)
      expect(space.start_date).to eq(2021-06-03)
      expect(space.name).to eq(2021-06-04)
    end 
  end

  describe '.listing' do
    
  end
end