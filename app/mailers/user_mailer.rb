class UserMailer < ApplicationMailer


 def registration_confirmation(email, token)
    @email = email
    @token = token
    mail(:to => "<#{email}>", :subject => "Registration Confirmation")
 end

 end