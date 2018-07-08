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
