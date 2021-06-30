require 'user'
# require 'pg'

RSpec.describe User do
	let(:user) { User.new(id: 1, name: "Fabio", email: "fabio@gmail.com")}

	it 'has different attributes' do
		expect(user.name).to eq('Fabio')
		expect(user.email).to eq('fabio@gmail.com')
	end

	describe '.create' do
	 it 'creates a new database' do
		connection = PG.connect(dbname: 'makersbnb_test')
		guest = User.create(name: 'Fabio', email: 'fabio@gmail.com', password: 'Fabio123!')
		
		expect(guest.name).to eq('Fabio')
		expect(guest.email).to eq('fabio@gmail.com')
	 end

	 it 'hashes the password using BCrypt' do
		 expect(BCrypt::Password).to receive(:create).with('password123')

		 User.create(name: 'Chucka', email: 'chucka@gmail.com', password: 'password123')
	 end
  end

	describe '.find' do
		it 'finds a user by id' do
			user = User.create(name: 'Chucka', email: 'chucka@gmail.com', password: 'password123')
			result = User.find(user.id)

			expect(result[0]['id']).to eq(user.id)
			expect(result[0]['email']).to eq(user.email)
		end
	end

	describe '.authenticate' do
		it 'returns a user given a correct username and password' do
			user = User.create(name: 'Chucka', email: 'chucka@gmail.com', password: 'password123')
			authenicated_user = User.authenicate(email: 'chucka@gmail.com', password: 'password123')

			expect(authenicated_user[0]['id']).to eq(user.id)
		end
	end
end
