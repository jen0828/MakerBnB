require 'space'
require 'mbnb'
require_relative 'web_helpers'

describe Space do
  describe '.create' do
    it 'creates a new space' do
      sig_in_log_in
      space = Space.create(name: "House", description: 'Beautiful property near the beach', price: 50, start_date: '2021-06-03' , finish_date: '2021-06-04', guest_id: 1)



      expect(space.name).to eq('House')
      expect(space.description).to eq('Beautiful property near the beach')
      expect(space.price).to eq('50')
      expect(space.start_date).to eq('2021-06-03')
      expect(space.finish_date).to eq('2021-06-04')
    end 
  end

  describe '.listing' do
    it 'lists all the spaces' do

      sig_in_log_in
      Space.create(name: "House", description: 'Beautiful property near the beach', price: 50, start_date: '2021-06-03' , finish_date: '2021-06-04', guest_id: 1)
      Space.create(name: "Flat", description: 'Beautiful property at the heart of the city', price: 45, start_date: '2021-07-13' , finish_date: '2021-07-24', guest_id: 2)
      result = Space.find


      expect(result[0].name).to eq('House')
      expect(result[0].description).to eq('Beautiful property near the beach')
      expect(result[0].price).to eq('50')
      expect(result[0].start_date).to eq('2021-06-03')
      expect(result[0].finish_date).to eq('2021-06-04')

      expect(result[1].name).to eq('Flat')
      expect(result[1].description).to eq('Beautiful property at the heart of the city')
      expect(result[1].price).to eq('45')
      expect(result[1].start_date).to eq('2021-07-13')
      expect(result[1].finish_date).to eq('2021-07-24')
    end
  end
