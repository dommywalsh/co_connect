class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
    @days = (@booking.end_date - @booking.start_date).to_i
    @total_price = @days * @booking.price
  end

  def new
    @booking = Booking.new
    @space = Space.find(params[:space_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @space = Space.find(params[:space_id])
    @booking.space = @space
    if @booking.save
      redirect_to space_booking_path(@space, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date, :user_id, :space_id)
  end
end
