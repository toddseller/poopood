require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  def email_confirmation
    @user = User.find_by_email('tseller@onyxwear.com')

    UserMailer.email_confirmation(@user)
  end
end
