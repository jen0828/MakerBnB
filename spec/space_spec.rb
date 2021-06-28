require './lib/space'
require 'mbnb'

describe Space do
  let(:user) { double(:user) }
  #let(:space) { double(:space) }
  it 'allows a user to create a space' do
    space = Space.new(name: 'hut', description: '3 bed hut', price: '50', start_date: '2020-02-08', finish_date: '2020-02-11')
    bnb = MbNb.new
    bnb.add(space)
    name = bnb.spaces
    expect(name.name).to eq 'hut'
  end
end