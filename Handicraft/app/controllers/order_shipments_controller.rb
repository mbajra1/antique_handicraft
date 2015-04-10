class OrderShipmentsController < ApplicationController
  before_action :set_order_shipment, only: [:show, :edit, :update, :destroy]

  # GET /order_shipments
  # GET /order_shipments.json
  def index
    @order_shipments = OrderShipment.all
  end

  # GET /order_shipments/1
  # GET /order_shipments/1.json
  def show
  end

  # GET /order_shipments/new
  def new
    @order_shipment = OrderShipment.new
  end

  # GET /order_shipments/1/edit
  def edit
  end

  # POST /order_shipments
  # POST /order_shipments.json
  def create
    @order_shipment = OrderShipment.new(order_shipment_params)

    respond_to do |format|
      if @order_shipment.save
        format.html { redirect_to @order_shipment, notice: 'Order shipment was successfully created.' }
        format.json { render :show, status: :created, location: @order_shipment }
      else
        format.html { render :new }
        format.json { render json: @order_shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_shipments/1
  # PATCH/PUT /order_shipments/1.json
  def update
    respond_to do |format|
      if @order_shipment.update(order_shipment_params)
        format.html { redirect_to @order_shipment, notice: 'Order shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_shipment }
      else
        format.html { render :edit }
        format.json { render json: @order_shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_shipments/1
  # DELETE /order_shipments/1.json
  def destroy
    @order_shipment.destroy
    respond_to do |format|
      format.html { redirect_to order_shipments_url, notice: 'Order shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_shipment
      @order_shipment = OrderShipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_shipment_params
      params.require(:order_shipment).permit(:shipment_id, :order_id, :customer_id, :shipper_name, :shipping_type, :shipping_name, :shipping_address, :shipping_city, :shipping_state_province)
    end
end
