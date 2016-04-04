if Rails.env.development? || Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.mailgun.org',
    port: 587,
    authentication: :plain,
    content_type: 'text/html'
    user_name: ENV['MAILGUN_SMTP_LOGIN'],
    password: ENV['MAILGUN_SMTP_LOGIN']
    domain: ENV['MAILGUN_SMTP_DOMAIN']
  }
  # ActionMailer::Base.smtp_settings = {
  #   address: 'smtp.gmail.com',
  #   port: 587,
  #   domain: ENV['GMAIL_DOMAIN'],
  #   authentication: :login,
  #   enable_starttls_auto: true,
  #   user_name: ENV['GMAIL_USERNAME'],
  #   password: ENV['GMAIL_PASSWORD']
  # }
end
