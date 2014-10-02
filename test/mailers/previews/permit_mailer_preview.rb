# Preview all emails at http://localhost:3000/rails/mailers/permit_mailer
class PermitMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/permit_mailer/permit_notification
  def permit_notification
    PermitMailer.permit_notification
  end

end
