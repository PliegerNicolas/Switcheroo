class OrdersController < ApplicationController
  before_action :find_selected_instrument, only: [:new]
  def new
    # Rename the method "create" and make it a post ?
    @order = Order.new(order_params)
    @order.status = 'pending' if @order.status == 'open'
    if @order.instrument.status == 'available'
      @order.instrument.status = 'pending'
      @order.instrument.save
    end
    @order.save
    authorize @order
    redirect_to instrument_path(@instrument.id)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.status = 'closed'
    @order.save
    authorize @order
    redirect_to dashboard_path
  end

  private

  def order_params
    {
      instrument_id: @instrument.id,
      renter_id: current_user.id,
      user_id: @instrument.user.id,
      start_date: params[:starts_at],
      end_date: params[:ends_at]
    }
  end

  def find_selected_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end
end
