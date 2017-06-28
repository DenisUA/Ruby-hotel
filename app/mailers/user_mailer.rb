class UserMailer < ApplicationMailer
  default from: 'reception@ruby-hotel.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to Ruby Hotel Site')
  end
end
