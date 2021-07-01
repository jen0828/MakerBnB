require 'mail'

class Email
mail = Mail.new do
	from 'makersbnb-jf2c2@test.com'
	to 'alessf13@gmail.com'
	subject 'hello'
	body 'another hello'
end

mail.delivery_method :sendmail

mail.deliver
end
