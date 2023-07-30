class JobNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.job_notification_mailer.job_notification.subject
  #
  def job_notification(user, ukfinancejob)
    @user = user
    @ukfinancejob = ukfinancejob
    mail(to: @user.email, subject: 'Job Opening Notification')
  end
end
