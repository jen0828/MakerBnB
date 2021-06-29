feature 'Adding a new space' do
  scenario 'A user can add a space to Makers BnB' do
    visit('/spaces/new')
    fill_in('name', with: 'Beach house')
    fill_in('description', with: 'cozy with sea view')
    fill_in('price', with: '$5')
    fill_in('start_date', with: '2021-08-28')
    fill_in('start_date', with: '2021-09-28')
    click_button('List my spaces')
    click_button('view spaces')

    expect(page).to have_content('Beach house')
  end
end