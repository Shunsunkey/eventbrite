require "test_helper"

class EventMailerTest < ActionMailer::TestCase
  test "participation_email" do
    mail = EventMailer.participation_email
    assert_equal "Participation email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
