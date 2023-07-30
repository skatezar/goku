class ApplicationMailer < ActionMailer::Base
  default from: "contact@graduateflow.com"
  layout "mailer"

  def default_url_options
    { host: 'graduateflow.com' }
  end
end
