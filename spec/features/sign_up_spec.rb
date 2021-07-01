feature 'sigining up' do
  scenario 'user signs up on landing page' do
    visit("/")
    fill_in("email", with: "fabio@gmail.com")
    fill_in("guest_name", with: "Fabio")
    fill_in("password", with: "123")
    click_button("Sign up") 


    expect(page).to have_content("Please fill in your details below:")

  end
end