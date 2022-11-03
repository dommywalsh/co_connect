class SpacesController < ApplicationController

  def index
    @spaces = Space.all
    # maybe do not include "my spaces in this"
  end

  def show
    @space = Space.find(params[:id])
    @booking = Booking.new
    # reviews if possible
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.user = current_user

    if @space.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :price, :description, :user_id)
  end
end
