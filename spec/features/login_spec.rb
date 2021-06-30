feature 'login' do
	scenario 'user logs in' do
		visit('/login')

		fill_in('email', with: 'fabio@gmail.com')
		fill_in('password', with: '123')
		click_button('Login')

		expect(page).to have_content('Would you like to book a space?')
	end
end