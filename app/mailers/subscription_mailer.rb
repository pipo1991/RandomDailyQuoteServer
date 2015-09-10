class SubscriptionMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to daily quotes service')
  end

  def daily_email(user,quote)
    @user = user
    @quote = quote
    mail(to: @user.email, subject: 'Today\'s quote')
  end
end
