require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "subscription_notice" do
    mail = UserMailer.subscription_notice
    assert_equal "Subscription notice", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
