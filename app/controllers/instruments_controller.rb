class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]

  def index
    @instruments = policy_scope(Instrument)
  end

  def show
    authorize @instrument
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instruments_params)
    authorize @instrument
    if @instrument.save?
      redirect_to instrument_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @restaurant # Add this line
  end

  def update
    authorize @restaurant # Add this line
    @instrument.update(instruments_params)
    redirect_to instrument_path(@instrument)
  end

  def destroy
    authorize @restaurant # Add this line
    @instrument.destroy
    redirect_to instruments_path, status: :see_other
  end

  private

  def instruments_params
    params.require(:instrument).permit(:name, :description, :address, :price)
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end

end
