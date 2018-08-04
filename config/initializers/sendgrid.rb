ActionMailer::Base.smtp_settings = {
  :user_name => 'apikey',
  :password => "#{Rails.application.credentials.dig(:sendgrid_password)}",
  :domain => 'zhengjiajun.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}
