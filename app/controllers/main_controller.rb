class MainController < ApplicationController
  def self.send_quotes_to_all
    quote=Quote.order("RANDOM()").first
    users=User.all
    for user in users do
      SubscriptionMailer.daily_email(user,quote).deliver_now
    end
  end

  def self.lol
    puts "lol"	
  end
end
