require 'test_helper'

class ModelMailerTest < ActionMailer::TestCase
  test "exp_permit_email_notification" do
    mail = ModelMailer.exp_permit_email_notification
    assert_equal "Exp permit email notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
