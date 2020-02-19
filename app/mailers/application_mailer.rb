# app/mailers/application_mailer.rb
class ApplicationMailer < ActionMailer::Base
  default from: 'toysandboxes@gmail.com'

  layout 'mailer'
end
