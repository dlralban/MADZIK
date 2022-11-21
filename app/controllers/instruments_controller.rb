class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show]

  def index
    @instruments = Instrument.all
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instruments_params)
    if @instrument.save?
      redirect_to instruments_path(@instrument)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def instruments_params
    params.require(:instrument).permit(:name, :description, :address, :price)
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end
end
