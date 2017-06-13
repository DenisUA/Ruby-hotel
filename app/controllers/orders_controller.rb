class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def edit
    return unless @order.cancelled? && !current_user.admin?
    respond_to do |format|
      format.html { redirect_to @order }
      format.json { render json: @order.errors, status: :forbidden }
    end
  end

  def show; end

  def create
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order }
        format.json { render json: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.cancelled!
    if @order.cancelled?
      respond_to do |format|
        format.html { redirect_to orders_path, notice: 'Order was cancelled' }
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.html { redirect_to orders_path, notice: 'Order wasn\'t cancelled due to error' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def order_params
    params.require(:order).permit(:start_from, :end_at, :total, :user_id, :apartment_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
