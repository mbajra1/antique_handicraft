class BidCartsController < ApplicationController
  before_action :set_bid_cart, only: [:show, :edit, :update, :destroy]

  # GET /bid_carts
  # GET /bid_carts.json
  def index
    @bid_carts = BidCart.all
  end

  # GET /bid_carts/1
  # GET /bid_carts/1.json
  def show

    @bid_cart_id=params[:id]

    #session[:user_id]=user.id

    customer_id=''
    if current_user
      email=current_user.email
      @customer=Customer.where(email: email)
      @customer.each do |customer|
        customer_id=customer.customer_id
      end

    end



    session[:user_id]=customer_id+'***'


    @bid_product=Product.where(product_id: @bid_cart.bid_product_id)
    #@product_id=0

    @bid_product.each do |product|
      @product_id=product.id
      @product_image_url=product.image_url
      @product_name=product.name
    end

    session[:bid_product_id]=@product_id

    @bid_actions=BidAction.where(bid_cart_id: @bid_cart_id)




    @session_user=session[:user_id]
    @winner=session[:winner_id]
    @winning_amount=session[:wining_amount]
  end

  # GET /bid_carts/new
  def new
    @product_for_bid=params[:bid_product_id]
    @bid_cart = BidCart.new

  end

  # GET /bid_carts/1/edit
  def edit
  end

  # POST /bid_carts
  # POST /bid_carts.json
  def create
    @bid_cart = BidCart.new(bid_cart_params)

    respond_to do |format|
      if @bid_cart.save
        format.html { redirect_to @bid_cart, notice: 'Bid cart was successfully created.' }
        format.json { render :show, status: :created, location: @bid_cart }
      else
        format.html { render :new }
        format.json { render json: @bid_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bid_carts/1
  # PATCH/PUT /bid_carts/1.json
  def update
    respond_to do |format|
      if @bid_cart.update(bid_cart_params)
        format.html { redirect_to @bid_cart, notice: 'Bid cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid_cart }
      else
        format.html { render :edit }
        format.json { render json: @bid_cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bid_carts/1
  # DELETE /bid_carts/1.json
  def destroy
    @bid_cart.destroy
    respond_to do |format|
      format.html { redirect_to bid_carts_url, notice: 'Bid cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_cart
      @bid_cart = BidCart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_cart_params
      params.require(:bid_cart).permit(:bid_product_id, :bid_end_date, :opening_price)
    end
end
