class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @my_instruments = policy_scope(Instrument)
    # @instruments = Instrument.all.where.not(user: current_user)
    # @instruments = Instrument.all
    if params[:query].present?
      @instruments = Instrument.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @instruments = Instrument.all
    end
    @markers = @instruments.geocoded.map do |instrument|
    {
      lat: instrument.latitude,
      lng: instrument.longitude,
      info_window: render_to_string(partial: "info_window", locals: {instrument: instrument}),
      image_url: helpers.asset_url("guitar.png")
    }
    end
  end

  def my_instruments
    @my_instruments = policy_scope(Instrument)
    @rentals = policy_scope(Rental)
    @my_rentals = Rental.where(instrument: @my_instruments)
    authorize @my_instruments
  end

  def show
    @instrument = Instrument.find(params[:id])
    authorize @instrument
    @rental = Rental.new
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
    authorize @instrument
  end

  def update
    @instrument = Instrument.find(params[:id])
    @instrument.update(instruments_params)
    authorize @instrument
    redirect_to instrument_path(@instrument)
  end

  def destroy
    authorize @instrument
    @instrument.destroy
    redirect_to instruments_path, status: :see_other
  end

  private

  def instruments_params
    params.require(:instrument).permit(:name, :description, :address, :price, :photo)
  end

  def set_instrument
    @instrument = Instrument.find(params[:id])
  end
end
