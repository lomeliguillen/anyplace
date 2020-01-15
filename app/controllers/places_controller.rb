class PlacesController < ApplicationController
  def index
    @places = Place.all
  end

  def show
    @place = Place.find_by_id(params[:id])
    if @place.blank?
      redirect_to new_place_path
    end
  end

  def edit
    @place = Place.find_by_id(params[:id])
    if @place.blank?
      return render_not_found if @place.blank?
    end 
  end

  def update
    @place = Place.find_by_id(params[:id])
    return render_not_found if @place.blank?

    @place.update_attributes(place_params)

    if @place.valid?
      redirect_to root_path
    else
      return render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find_by_id(params[:id])
    return render_not_found if @place.blank?
    @place.destroy
    redirect_to root_path
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def place_params
    params.require(:place).permit(:name, :address)
  end

  
end
