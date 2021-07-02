feature 'Authentication' do

	context 'login' do
		let!(:user) { User.create(guest_name: "Fabio", email: 'test@test.com', password: 'test123')}
	  
		scenario 'user logs in' do
			visit('/login')
	
			fill_in('email', with: 'test@test.com')
			fill_in('password', with: 'test123')
			click_button('Login')
	
			expect(page).to have_content('Would you like to book a space?')
		end

		scenario 'user logs in with the wrong password' do
			visit('/login')
	
			fill_in('email', with: user.email)
			fill_in('password', with: 'incorrect_password')
			click_button('Login')
	
			expect(page).to have_content('It seems like your email address or password are incorrect!')
		end
  end

	context 'logout' do
		scenario 'A user logs out' do
			visit('/login')
			fill_in('email', with: 'test@test.com')
			fill_in('password', with: 'test123')
			click_button('Login')

			click_button('Log out')
		
			expect(page).to have_content('Welcome')
		end
	end
end