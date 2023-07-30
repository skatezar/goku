# Preview all emails at http://localhost:3000/rails/mailers/job_notification_mailer
class JobNotificationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/job_notification_mailer/job_notification
  def job_notification
    JobNotificationMailer.job_notification
  end

end
