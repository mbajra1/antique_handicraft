class CartItemsController < ApplicationController
  before_action :set_cart_item, only: [:show, :edit, :update, :destroy]

  # GET /cart_items
  # GET /cart_items.json
  def index
    @cart_items = CartItem.all
  end

  # GET /cart_items/1
  # GET /cart_items/1.json
  def show
  end

  # GET /cart_items/new
  def new
    @cart_item = CartItem.new
  end

  # GET /cart_items/1/edit
  def edit
  end

  # POST /cart_items
  # POST /cart_items.json
  def create

    @cart=current_cart
    @product = Product.where(product_id: params[:product_id])

    product_id=''
    @product.each do |product|
      product_id=product.product_id
    end

    @cart_item = @cart.add_product(product_id)

    #@cart_item = CartItem.new(cart_item_params)

    respond_to do |format|
      if @cart_item.save
=begin
        format.html { redirect_to @cart_item, notice: 'Cart item was successfully created.' }
        format.json { render :show, status: :created, location: @cart_item }
=end
        format.html { redirect_to :controller => 'catalog',:id => product.product_id, notice: 'Cart item was successfully created.' }
        format.json { render jason: @cart_item, status: :created, location: @cart_item, notice: 'Cart item was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cart_items/1
  # PATCH/PUT /cart_items/1.json
  def update
    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to @cart_item.shopping_cart, notice: 'Cart item was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cart_items/1
  # DELETE /cart_items/1.json
  def destroy
    @cart_item.destroy
    respond_to do |format|
      format.html { redirect_to @cart_item.shopping_cart, notice: 'Cart item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_item
      @cart_item = CartItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_item_params
      params.require(:cart_item).permit(:shopping_cart_id, :product_id, :seller_id, :price, :quantity)
    end
end
