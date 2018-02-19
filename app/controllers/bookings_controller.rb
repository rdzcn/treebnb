class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @tree = Tree.find(params[:tree_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.tree = @tree
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_check_in, :date_check_out, :total_price)
  end

end
