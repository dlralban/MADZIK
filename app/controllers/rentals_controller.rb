class RentalsController < ApplicationController
  before_action :set_instrument, only: %i[create]

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    if @rental.valid?
      redirect_to instruments_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rental_params
    params.require(:instrument).permit(:name, :description, :address, :price)
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end
end
