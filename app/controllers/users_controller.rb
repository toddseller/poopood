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
    user = User.find_by_confirmation_token(params[:confirmation_token])

    if user
      user.validate_email
      user.save
    end
  end
end
