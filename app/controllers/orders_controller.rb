class OrdersController < ApplicationController
  before_action :find_selected_instrument
  def new
    # Rename the method "create" and make it a post ?
    @order = Order.new(order_params)
    @order.status = 'closed' if @order.status == 'open'
    @order.save
    authorize @order
    redirect_to instrument_path(@instrument.id)
  end

  private

  def order_params
    {
      instrument_id: @instrument.id,
      renter_id: current_user.id,
      user_id: @instrument.user.id,
      due_date: Date.new # @TODO Making adding a real due date possible.
    }
  end

  def find_selected_instrument
    @instrument = Instrument.find(params[:instrument_id])
  end
end
