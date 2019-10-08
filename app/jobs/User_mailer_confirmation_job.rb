class UserMailerConfirmationJob < ApplicationJob
  queue_as :default

  def perform(email, token)
    UserMailer.registration_confirmation(email, token).deliver
  end
end
