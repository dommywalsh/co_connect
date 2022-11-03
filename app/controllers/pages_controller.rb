class PagesController < ApplicationController
  def home
    @featured_spaces = Space.all.sample(6)
  end

  def dashboard
    @user = current_user

    # spaces variable

    @spaces = @user.spaces

    # bookings variables
    @bookings = @user.bookings
    @current_bookings = @user.bookings.select { |booking| booking.status == "accepted" }
    @future_bookings = @user.bookings.select { |booking| booking.status == "pending" }
    @past_bookings = @user.bookings.select { |booking| booking.status == "rejected" }
  end
end


