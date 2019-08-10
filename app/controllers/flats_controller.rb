class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create(params_flat)
    if @flat.save
      redirect_to flat_path(flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @flat.update
      redirect_to flat_path(flat)
    else
      render :edit
    end
  end

  def destroy
    @flat.destroy

    redirect_to flat_path(flat)
  end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def params_flat
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end
end
