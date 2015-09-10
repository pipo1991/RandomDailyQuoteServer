class UsersController < ApplicationController

  def subscribe_page
    flash[:notice]=""
    render('subscribe')
  end

  def subscribe
    @subscriber = User.new
    @subscriber.email = params[:user][:email]
    if @subscriber.save then
      flash[:success] = "You were added sucessfully to the Subscribers."
      SubscriptionMailer.welcome_email(@subscriber).deliver_now
      redirect_to root_path
    else
      flash[:notice] = @subscriber.errors.full_messages
    end
    
  end
  
  def unsubscribe_page
    flash[:notice]=""
    render('unsubscribe')
  end


  def unsubscribe
    if  User.exists?(:email => params[:user][:email]) then
      subscriber = User.find_by_email(params[:user][:email])
      if subscriber.delete then
        flash[:success] = "You were removed sucessfully to the Subscribers."
        redirect_to root_path
      else
        flash[:notice] = @subscriber.errors.full_messages
      end
    else
      flash[:notice] = "User is not subscribed already"

    end
  end
end
