require 'user'

RSpec.describe User do
	let(:user) { User.new("Fabio", "fabio@gmail.com", "Fabio123!")}

	it 'has different attributes' do
		expect(user.name).to eq('Fabio')
		expect(user.email).to eq('fabio@gmail.com')
		expect(user.password).to eq('Fabio123!')
	end

end
