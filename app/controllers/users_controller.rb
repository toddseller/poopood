class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])

    if request.xhr?
      respond_to do |format|
        if @user.save
          UserMailer.email_confirmation(@user).delivery_now
        end
      end
    end
  end

  def confirmation_email
    user = User.find_by_confirmation_token(params[:token])

    if user
      user.validate_email
      user.save
      p '*' * 80
      p 'User confirmed'
    end
  end

  def unsubscribe
    user = User.find_by_unsubscribe_token(params[:token])

    if user
      user.destroy
      p '*' * 80
      p 'User deleted'
    end
  end
end
