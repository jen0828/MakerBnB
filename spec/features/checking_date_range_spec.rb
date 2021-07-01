feature 'Date range' do
  scenario 'User can see available bookings spaces' do
    visit("/")
    fill_in("email", with: "fabio@gmail.com")
    fill_in("name", with: "Fabio")
    fill_in("password", with: "test123")
    click_button("Sign up")

    fill_in('email', with: "fabio@gmail.com")
		fill_in('password', with: 'test123')
		click_button('Login')

    click_button('List a space')
    fill_in('name', with: 'Beach house')
    fill_in('description', with: 'cozy with sea view')
    fill_in('price', with: '5')
    fill_in('start_date', with: '2021-08-28')
    fill_in('finish_date', with: '2021-09-28')
    click_button('List my spaces')

    fill_in('start_date', with: '2021-08-28')
    fill_in('finish_date', with: '2021-09-28')
    click_button('Check availability')

    expect(page).to have_content('Beach house')
  end
end