require 'space'
require 'mbnb'
require_relative 'web_helpers'

describe Space do
  describe '.create' do
    it 'creates a new space' do
      password_hash = BCrypt::Password.create('password123')
      user = User.create(guest_name: 'Chucka', email: 'chucka@gmail.com', password: password_hash)
      result = User.find(user.id)
      space = Space.create(name: "House", description: 'Beautiful property near the beach', price: 50, start_date: '2021-06-03' , finish_date: '2021-06-04', guest_id: result.id)



      expect(space.name).to eq('House')
      expect(space.description).to eq('Beautiful property near the beach')
      expect(space.price).to eq('50')
      expect(space.start_date).to eq('2021-06-03')
      expect(space.finish_date).to eq('2021-06-04')
    end 
  end

  describe '.listing' do
    it 'lists all the spaces' do
      password_hash = BCrypt::Password.create('password123')
      user_1 = User.create(guest_name: 'Chucka', email: 'chucka@gmail.com', password: password_hash)
      user_2 = User.create(guest_name: 'Frank', email: 'frank@gmail.com', password: password_hash)
      result = User.find(user_1.id)
      result_2 = User.find(user_2.id)
  
      Space.create(name: "House", description: 'Beautiful property near the beach', price: 50, start_date: '2021-06-03' , finish_date: '2021-06-04', guest_id: result.id)
      Space.create(name: "Flat", description: 'Beautiful property at the heart of the city', price: 45, start_date: '2021-07-13' , finish_date: '2021-07-24', guest_id: result_2.id)
      result = Space.find


    

      expect(result[0].name).to eq('Flat')
      expect(result[0].description).to eq('Beautiful property at the heart of the city')
      expect(result[0].price).to eq('45')
      expect(result[0].start_date).to eq('2021-07-13')
      expect(result[0].finish_date).to eq('2021-07-24')

      expect(result[1].name).to eq('House')
      expect(result[1].description).to eq('Beautiful property near the beach')
      expect(result[1].price).to eq('50')
      expect(result[1].start_date).to eq('2021-06-03')
      expect(result[1].finish_date).to eq('2021-06-04')
    end
  end
end
