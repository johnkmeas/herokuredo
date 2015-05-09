class UserMailer < ActionMailer::Base
	default from: "johnkmeas@gmail.com"
	def contact_form(email, name, message)
		@message = message
		mail(:from => email,
				:to => 'johnkmeas@gmail.com',
				:subject => "A new contact form message from #{name}")
	end
end
