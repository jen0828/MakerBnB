feature 'Date range' do
  scenario 'User can see available bookings spaces' do
    visit('/spaces/new')
    fill_in('name', with: 'Beach house')
    fill_in('description', with: 'cozy with sea view')
    fill_in('price', with: '$5')
    fill_in('start_date', with: '2021-08-28')
    fill_in('start_date', with: '2021-09-28')
    click_button('List my spaces')

    visit ('/listing')
    select '2021-08-28', :from => 'start_date'
    select '2021-09-28', :from => 'finish_date'

    expect(page).to have_content('Beach house')
  end
end