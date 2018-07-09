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
    p params[:confirmation_token]
    p 'FUCK YEAH!'
  end
end
