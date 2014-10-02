require 'test_helper'

class PermitMailerTest < ActionMailer::TestCase
  test "permit_notification" do
    mail = PermitMailer.permit_notification
    assert_equal "Permit notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
