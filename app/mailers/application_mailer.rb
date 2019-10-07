class ApplicationMailer < ActionMailer::Base
  default :from => "railsmtesting@gmail.com"
  layout 'mailer'
end
