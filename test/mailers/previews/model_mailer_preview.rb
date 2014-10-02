# Preview all emails at http://localhost:3000/rails/mailers/model_mailer
class ModelMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/model_mailer/exp_permit_email_notification
  def exp_permit_email_notification
    ModelMailer.exp_permit_email_notification
  end

end
