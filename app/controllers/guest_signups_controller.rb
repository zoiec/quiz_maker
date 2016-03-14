class GuestSignupsController < ApplicationController

  def new
    @next = params[:next] || root_path
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      @user.update_attributes(guest_id: nil, guest: false)
      sign_in(:user, @user, bypass: true)
      redirect_to params[:next]
    else
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
