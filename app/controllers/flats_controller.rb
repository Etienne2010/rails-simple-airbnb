class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :destroy, :update, :edit]

  def index
    if !params[:search].nil?
      @search = params[:search]
      @flats = Flat.where("name LIKE '%#{@search}%'")
    else
      @flats = Flat.all
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @edition = false
    @flat = Flat.new(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def show
    array = @flat.address.split(" ")
    texte = array.join("+")
    @url = "https://maps.googleapis.com/maps/api/staticmap?center=" + texte + "&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyAy57IuL7mJv6r2Ilz6nyDY3_7AQve3ZBU"

  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

  def edit
    @edition = true
    render :new
  end

  def update
    @edition = false
    @flat.update(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def search_params
    params.require(:flat).permit(:search)
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
