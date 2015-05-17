class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    if current_user
      @customer.email = current_user.email
      @customer.save

      @cust =Customer.where("email=?",current_user.email)
      shipping_book = ShippingBook.new

       for customer in @cust
          shipping_book.customer_id = customer.customer_id
          shipping_book.shipping_name = customer.first_name
          shipping_book.shipping_address = customer.address
          shipping_book.shipping_city = customer.city
          shipping_book.shipping_state_province = customer.state_province
          shipping_book.shipping_zip_postal= customer.zip_postal_code
          shipping_book.shipping_country_region = customer.country_region

       end
      shipping_book.save
    end
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Your Customer Account was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Your Customer Account was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy

    # delete the association from Roles_Users
    if current_user
      @user = User.find(current_user.id)

      if @user.role? ("customer")
      customer = @user.roles.find_by_name("customer")
      @user.roles.delete(customer)
     # @user.roles.save
      end

      if @user.role? ("seller")
        @products = Product.where("u_id=?", current_user.id)
        @products.delete(@products) # delete associate product
        seller = @user.roles.find_by_name("seller")
        @user.roles.delete(seller)
        @seller= Seller.find_by_email(current_user.email)
        @seller.delete
        @seller.save
      end

      # delete associate role

      # delete associate user account
      @user.delete

    end

    @customer.destroy
    respond_to do |format|
      format.html { redirect_to home_path, notice: 'Your Customer Account was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:customer_id, :last_name, :first_name, :email, :home_phone, :cell_phone, :fax, :address, :city, :state_province, :zip_postal_code, :country_region)
    end
end
