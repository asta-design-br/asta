class RegistrationsController < Devise::RegistrationsController
  def sign_up_choice
    @user = User.new
  end
end
