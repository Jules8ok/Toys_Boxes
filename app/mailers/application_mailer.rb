# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: 'your-email@example.com'

  layout 'mailer'
end
