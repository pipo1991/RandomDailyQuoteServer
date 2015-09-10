require 'test_helper'

class SubscriptionMailerTest < ActionMailer::TestCase
  def welcome_email_preview
  	SubscriptionMailer.welcome_email(User.first)
  end

  def welcome_email_preview
  	SubscriptionMailer.daily_email(User.first,Quote.first)
  end
end
