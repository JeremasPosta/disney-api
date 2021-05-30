class UserMailer < ApplicationMailer
# require 'sendgrid-ruby'
# include SendGrid
# require 'json'
default :from => ENV['DEFAULT_EMAIL_FROM']

  def new_user_email(user)
      @user = user
      mail(to: @user.email, subject: "Welcome to Alkemy-Disney-Api!")
  end

end