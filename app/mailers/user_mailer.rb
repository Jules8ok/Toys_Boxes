class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site', delivery_method_options: { api_key: '53bfd620043472daffe11199bdc73d47', secret_key: '66ccf1ef9659a8d751edcb294a4fba58' })

  end
end
