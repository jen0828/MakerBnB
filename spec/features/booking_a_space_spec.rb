feature 'Booking a space' do
  scenario 'A guest books an available space' do

		# host 

		host = User.new(id: 1, guest_name: 'Fabio', email: 'fabio@gmail.com', password: 'Fabio123!')

		# Lists a space

		space = Space.new(id: 3, name: "House", description: 'Beautiful property near the beach', price: 50, start_date: '2021-06-03' , finish_date: '2021-06-04', guest_id: 1)

		# logs out 

		click_button('log_out')

		# Guest signs up

		guest = User.new(id: 2, guest_name: 'Frank', email: 'frank@gmail.com', password: 'Frank123!')


   # listing all spaces

		click_button('List spaces')
		click_button('book')

		expect(page).to have_content('Beautiful property near the beach')
	end
end