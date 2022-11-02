class PagesController < ApplicationController
  def home
    @featured_spaces = Space.all.sample(6)
  end

  def dashboard
    @user = current_user
    # @booking = @user.bookings

    # spaces variable

    @spaces = @user.spaces
    # @pending_bookings = @spaces.bookings.select { |booking| booking.status == "pending" }
    # @confirmed_bookings = @spaces.bookings.select { |booking| booking.status == "accepted" }

    # bookings variables

    @current_bookings = @user.bookings.select { |booking| booking.status == "accepted" }
    @future_bookings = @user.bookings.select { |booking| booking.status == "pending" }
    @past_bookings = @user.bookings.select { |booking| booking.status == "rejected" }
  end
end
