class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]

  # GET /sellers
  # GET /sellers.json
  def index
    @sellers = Seller.all

  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
  end

  # GET /sellers/new
  def new
    @seller = Seller.new

  end

  # GET /sellers/1/edit
  def edit
  end

  # POST /sellers
  # POST /sellers.json
  def create

    @seller = Seller.new(seller_params)
    if current_user
    u = User.find(current_user.id)
    u.roles << Role.find_by_name("seller")
    u.save

    @customer =Customer.where("email=?",current_user.email)
    @seller.email = current_user.email

    for customer in @customer
      @seller.first_name = customer.first_name
      @seller.last_name = customer.last_name
      @seller.home_phone = customer.home_phone
      @seller.cell_phone = customer.cell_phone
      @seller.fax= customer.fax
      @seller.address = customer.address
      @seller.city = customer.city
      @seller.state_province = customer.state_province
      @seller.zip_postal_code = customer.zip_postal_code
      @seller.country_region = customer.country_region

    end

    @seller.save
    end

    respond_to do |format|
      if @seller.save
        format.html { redirect_to @seller, notice: 'Your Seller Account was successfully created.' }
        format.json { render :show, status: :created, location: @seller }
      else
        format.html { render :new }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sellers/1
  # PATCH/PUT /sellers/1.json
  def update
    respond_to do |format|
      if @seller.update(seller_params)
        format.html { redirect_to @seller, notice: 'Your Seller Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @seller }
      else
        format.html { render :edit }
        format.json { render json: @seller.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy

    # delete the association from Roles_Users
    if current_user
      u = User.find(current_user.id)
      role = u.roles.find_by_name("seller")

      @products = Product.where("u_id=?", current_user.id)

      @products.delete(@products) # delete associate product

      if role
        u.roles.delete(role) # delete role
      end
    end

    @seller.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Your Sellers Account was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seller
      @seller = Seller.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seller_params
      params.require(:seller).permit(:seller_id, :company, :last_name, :first_name, :email, :business_phone, :home_phone, :cell_phone, :fax, :address, :city, :state_province, :zip_postal_code, :country_region)
    end
end
