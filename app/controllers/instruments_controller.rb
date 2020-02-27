class InstrumentsController < ApplicationController
  before_action :set_instrument, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      query_search(params[:query])
    else
      @instruments = policy_scope(Instrument)
    end

    render layout: "layouts/homepage"
  end

  def show
    @instrument = Instrument.find(params[:id])
    if params[:date_select].present? && params[:date_select][:starts_at].present?
      order_date = params[:date_select]
      order_date = { starts_at: order_date[:starts_at], ends_at: order_date[:ends_at] }
      redirect_to new_instrument_order_path(@instrument.id, order_date)
    else
      render :show
    end
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

  def favorite
    skip_authorization
    if is_favorite?
      @favorite = Favorite.new instrument_id: params[:instrument_id], user_id: current_user.id
      @favorite.save
      @saved = true
    else
      @id = Favorite.where("instrument_id = ? and user_id = ?", params[:instrument_id], current_user).pluck(:id)
      Favorite.destroy(@id)
      @saved = false
    end

    respond_to do |format|
      format.js
    end
  end

  private

  def set_instrument
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def instrument_params
    params.require(:instrument).permit(
      :name,
      :price, :description,
      :latitude, :longitude, :address,
      :status, :views,
      :user_id,
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

  def is_favorite?
    Favorite.where("instrument_id = ? and user_id = ?", params[:instrument_id], current_user).empty?
  end
end
