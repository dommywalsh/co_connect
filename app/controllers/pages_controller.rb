class PagesController < ApplicationController
  def home
    @featured_spaces = Space.all.sample(6)
  end

  def dashboard
    @user = current_user
    # @booking = @user.bookings
  end
end
