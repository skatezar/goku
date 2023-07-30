require "test_helper"

class JobNotificationMailerTest < ActionMailer::TestCase
  test "job_notification" do
    mail = JobNotificationMailer.job_notification
    assert_equal "Job notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
