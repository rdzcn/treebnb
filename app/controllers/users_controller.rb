class UsersController < ApplicationController

  def dashboard
    @bookings = Booking.where(user_id: current_user.id).order(date_check_in: :asc)
    @trees = Tree.where(user_id: current_user.id)
    authorize current_user
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    authorize @user
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :phone_number, photo: [])
  end
end

