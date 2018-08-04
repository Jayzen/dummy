require 'benchmark'
require 'faker'

demo = "#{Rails.application.credentials.dig(:sendgrid_password)}"
p demo
