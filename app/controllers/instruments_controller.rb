class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      query_search(params[:query])
    else
      @instruments = policy_scope(Instrument)
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
    @instrument.address = [current_user.street_name, current_user.location, current_user.country].compact.join(', ')
  end

  def create
    @instrument = Instrument.new(instrument_params)
    authorize @instrument
    @instrument.user = current_user

    if @instrument.save
      redirect_to instrument_path(@instrument.id)
    else
      render :new
    end
  end

  def edit
    @instrument = Instrument.find(params[:id])
  end

  def update
    @instrument.update(instrument_params)
    redirect_to instrument_path
  end

  def destroy
    Instrument.destroy(@instrument.id)
    redirect_to instrument_path
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
      :description,
      :latitude,
      :longitude,
      :status,
      :views,
      :user_id,
      :address,
      photos: []
    )
  end

  def query_search(query)
    @query = query
    instruments = policy_scope(Instrument)
    @instruments = instruments.where(
      "instruments.name iLike '%#{query}%'
      or instruments.description iLike '%#{query}%'"
    )
  end
end
