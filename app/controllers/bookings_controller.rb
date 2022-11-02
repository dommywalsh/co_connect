class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @space = Space.find(params[:space_id])
    @days = (@booking.end_date - @booking.start_date).to_i
    @total_price = @days * @space.price
  end

  def new
    @booking = Booking.new
    @space = Space.find(params[:space_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    # user associated with booking is the current user
    @space = Space.find(params[:space_id])
    # the associated space is found in the url params
    @booking.space = @space
    # the space associated with the booking is the space in the url params
    if @booking.save
      redirect_to space_booking_path(@space, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept_booking
    @booking = Booking.find(params[:id])
    @booking.update(status: 1)
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    @booking.update(status: 2)
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date, :user_id, :space_id)
  end
end
