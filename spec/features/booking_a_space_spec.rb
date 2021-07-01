feature 'Booking a space' do
  scenario 'A guest books an available space' do
    visit('/login')
	
			fill_in('email', with: 'test@test.com')
			fill_in('password', with: 'test123')
			click_button('Login')
  end
end