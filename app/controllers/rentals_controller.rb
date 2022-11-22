class RentalsController < ApplicationController
  before_action :set_instrument, only: %i[create]
  before_action :set_rental, only: %i[edit update show]

  def new
    @rental = Rental.new
    authorize @rental # Add this line
  end

  def create
    @rental = Rental.new(rental_params)
    authorize @rental
    if @rental.valid?
      redirect_to instruments_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @rental
  end

  def update
    authorize @rental
  end

  def index
    @rentals = policy_scope(Rental)
  end


  private

  def rental_params
    params.require(:instrument).permit(:name, :description, :address, :price)
  end

  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end

end
