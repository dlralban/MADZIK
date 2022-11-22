class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]

  def index
    @instruments = policy_scope(Instrument)
  end

  def show
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
  end

  def create
    @instrument = Instrument.new(instruments_params)
    @instrument.user = current_user
    authorize @instrument
    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
    auhtorize @instrument
  end

  def update
      @instrument = Instrument.find(params[:id])
      @instrument.update(instruments_params)
      authorize @instrument 
      redirect_to instrument_path(@instrument)
  end
  

  def destroy
    @instrument = Instrument.find(params[:id])
    authorize @instrument
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
