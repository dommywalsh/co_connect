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
    @space = Space.find(params[:space_id])
    @days = (@booking.end_date - @booking.start_date).to_i
    @total_price = @days * @space.price
    @booking.price = @total_price
    @booking.space = @space
    if @booking.save
      redirect_to space_booking_path(@space, @booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.status = "confirmed"
    @booking.save

    redirect_to dashboard_path
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.status = "rejected"
    @booking.save

    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:price, :start_date, :end_date, :user_id, :space_id)
  end
end
