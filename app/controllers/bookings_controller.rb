class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    @tree = Tree.find(params[:tree_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @tree = Tree.find(params[:tree_id])
    @booking.tree = @tree
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to tree_booking_path(@tree, @booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:date_check_in, :date_check_out, :total_price)
  end

end
