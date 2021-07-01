def sig_in_log_in

	#sing in

	visit("/")
	fill_in("email", with: "fabio@gmail.com")
	fill_in("guest_name", with: "Fabio")
	fill_in("password", with: "123")
	click_button("Sign up") 

	# login

	visit('/login')		
	fill_in('email', with: 'test@test.com')
	fill_in('password', with: 'test123')
	click_button('Login')

end
