require 'user'
require 'bcrypt'

RSpec.describe User do
	let(:user) { User.new(id: 1, name: "Fabio", email: "fabio@gmail.com", password: "password123")}

	context 'instance methods' do

		it 'has different attributes' do
			expect(user.name).to eq('Fabio')
			expect(user.email).to eq('fabio@gmail.com')
		end
	
		it 'hashes the password using BCrypt' do
			expect(BCrypt::Password).to receive(:create).with('password123')
	
			User.create(name: 'Chucka', email: 'chucka@gmail.com', password: 'password123')
		end

		it 'logs in a user and change his status' do
			expect(user.loged_in = true).to be_truthy
		end

		it 'logs out a user and change his status' do
			expect(user.loged_in = false).to be_falsy
		end
	end

  context 'class methods' do

		describe '.create' do
			it 'creates a new user instance that is also stored into the DB' do
			 connection = PG.connect(dbname: 'makersbnb_test')
			 guest = User.create(name: 'Fabio', email: 'fabio@gmail.com', password: 'Fabio123!')
			 
			 expect(guest.name).to eq('Fabio')
			 expect(guest.email).to eq('fabio@gmail.com')
			end
		 end
	 
	 
		 describe '.find' do
			 it 'finds a user by id' do
				 password_hash = BCrypt::Password.create('password123')
				 user = User.create(name: 'Chucka', email: 'chucka@gmail.com', password: password_hash)
				 result = User.find(user.id)
	 
				 expect(result.id).to eq(user.id)
				 expect(result.email).to eq(user.email)
			 end
		 end
	 
		 describe '.authenticate' do
			 context 'when valid' do
				 it 'returns a user given a correct username and password' do
					 user = User.create(name: 'Chucka', email: 'chucka@gmail.com', password: 'password123')
					 authenicated_user = User.authenticate(email: 'chucka@gmail.com', password: 'password123')
		 
					 expect(authenicated_user.password).to eql(user.password)
				 end
			 end
	 
			 context 'when password is invalid' do
				 it 'returns nil' do
					 user = User.create(name: 'Chucka', email: 'chucka@gmail.com', password: 'password123')
					 authenicated_user = User.authenticate(email: 'chucka@gmail.com', password: 'password456')
		 
					 expect(authenicated_user).to eq(nil)
				 end
			 end
	 
			 context 'when email is invalid' do
				 it 'returns nil' do
					 user = User.create(name: 'Chucka', email: 'chucka@gmail.com', password: 'password123')
					 authenicated_user = User.authenticate(email: 'incorrect@test.com', password: 'password123')
		 
					 expect(authenicated_user).to eq(nil)
				 end
			 end
		 end
	end
end
