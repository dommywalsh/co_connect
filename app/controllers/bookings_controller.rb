class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @space = Space.find(params[:space_id])
  end

  def create
    @booking = Booking.new(booking_params)

    @booking.user = current_user
    @space = Space.find(params[:space_id])
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date, :user_id, :space_id)
  end
end
