class RentalsController < ApplicationController
  before_action :set_instrument, only: %i[create new]
  before_action :set_rental, only: %i[show edit update show destroy]

  def show
    authorize @rental
  end

  def new
    @rental = Rental.new
    authorize @rental
  end

  def create
    @rental = Rental.new(rental_params)
    authorize @rental
    @rental.instrument = @instrument
    @rental.user = current_user
    if @rental.save
      redirect_to rentals_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @rental
  end

  def update
    authorize @rental
    @rental.update(status: params[:rental][:status])
    redirect_to rentals_path
  end

  def index
    @rentals = policy_scope(Rental)
    my_instruments = Instrument.all.where(user: current_user)
    @my_rentals = Rental.where(instrument: my_instruments)
  end

  def destroy
    authorize @rental
    @rental.destroy
    redirect_to rentals_path, status: :see_other
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end

  def set_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end

  def set_rental
    @rental = Rental.find(params[:id])
  end
end
