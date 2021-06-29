require 'user'
require 'pg'

RSpec.describe User do
	let(:user) { User.new(id: 1, name: "Fabio", email: "fabio@gmail.com", password: "Fabio123!")}

	it 'has different attributes' do
		expect(user.name).to eq('Fabio')
		expect(user.email).to eq('fabio@gmail.com')
		expect(user.password).to eq('Fabio123!')
	end

	it 'creates a new database' do
		connection = PG.connect(dbname: 'makersbnb_test')
		guest = User.create(name: 'Fabio', email: 'fabio@gmail.com', password: 'Fabio123!')
		
		expect(guest.name).to eq('Fabio')
		expect(guest.email).to eq('fabio@gmail.com')
		expect(guest.password).to eq('Fabio123!')
	end
end
