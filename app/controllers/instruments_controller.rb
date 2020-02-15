class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]

  def index
    @instruments = policy_scope(Instrument)
  end

  def show
  end

  def new
    @instrument = Instrument.new
  end

  def create
    @instrument = Instrument.new(instrument_params)
    if @instrument.save
      redirect_to instrument_path(@instrument.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @instrument.update(instrument_params)
    redirect_to instrument_path
  end

  def destroy
    Cocktail.destroy(@cocktail.id)
    redirect_to Cocktail_path
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def instrument_params
    params.require(:instrument).permit(
      :name,
      :price,
      :latitude,
      :longitude,
      :status,
      :views,
      :user_id
    )
  end
end
