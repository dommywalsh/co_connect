class DashboardsController < ApplicationController
  def show
    @user = current_user
    @booking = @user.bookings
    # @space = Space.find(params[:space_id])
    # @days = (@booking.end_date - @booking.start_date).to_i
    # @total_price = @days * @space.price
  end
end
