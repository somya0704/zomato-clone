class StaffMailer < ApplicationMailer
  
  def registration_confirmation(email, token, password)
    @email = email
    @token = token
    @password = password
    mail(:to => "<#{email}>", :subject => "Registration Confirmation")
  end
end
