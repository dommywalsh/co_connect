class SpacesController < ApplicationController

  def index
    if params[:query].present?
    @spaces = Space.search_by_name_and_description(params[:query])
    else
      @spaces = Space.all
    end

    @markers = @spaces.geocoded.map do |space|
      {
        lat: space.latitude,
        lng: space.longitude,
        info_window: render_to_string(partial: "info_window", locals: { space: space }),
        image_url: helpers.asset_url("LogoGold.png")
      }
    end
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
    params.require(:space).permit(:name, :address, :price, :description, :user_id, :image)
  end
end
