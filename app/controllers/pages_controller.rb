class PagesController < ApplicationController
  def home
    @spaces
  end

  def dashboard
    @user = current_user
    # @booking = @user.bookings
  end
end
