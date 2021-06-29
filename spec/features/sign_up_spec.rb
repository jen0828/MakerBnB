feature 'sigining up' do
  scenario 'user signs up on landing page' do
    visit("/")
    fill_in("email", with: "fabio@gmail.com")
    fill_in("name", with: "Fabio")
    click_button("Sign up") 

    expect(page).to have_content("Welcome")
  end
end