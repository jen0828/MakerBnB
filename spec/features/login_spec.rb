feature 'Authentication' do
	context 'Login' do
		let!(:user) { User.create(name: "Fabio", email: 'test@test.com', password: 'test123')}
	  
		scenario 'user logs in' do
			visit('/login')
	
			fill_in('email', with: user.email)
			fill_in('password', with: 'test123')
			click_button('Login')
	
			expect(page).to have_content('Would you like to book a space?')
			expect(page).to have_content('/spaces')
		end

		scenario 'user logs in with the wrong password' do
			visit('/login')
	
			fill_in('email', with: user.email)
			fill_in('password', with: 'incorrect_password')
			click_button('Login')
	
			expect(page).to have_content('Your email or password are incorrect')
			expect(page).to have_content('/')
		end
		
	end
end