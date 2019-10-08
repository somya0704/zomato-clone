class StaffConfirmationEmailJob < ApplicationJob
  queue_as :default

  def perform(email, token, password)
    StaffMailer.registration_confirmation(email, token, password).deliver
  end
end
