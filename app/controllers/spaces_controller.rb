class SpacesController < ApplicationController

  def index
    @spaces = Space.all
  end

  def show
    @space = Space.find(params[:id])
  end

  def new
    @space = Space.new
  end

  def create
    @space = Space.new(space_params)
    @space.save
    # No need for app/views/spaces/create.html.erb
    redirect_to space_path(@space)
  end

  private

  def space_params
    params.require(:space).permit(:name, :address, :price)
  end
end
