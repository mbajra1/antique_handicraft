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
        format.html { redirect_to @customer, notice: 'Your Sellers Account was successfully updated.' }
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
      u = User.find(current_user.id)
      role = u.roles.find_by_name("customer")

      # delete associate role
      if role
        u.roles.delete(role)
      end

      # delete associate user account
      # u.delete

    end

    @customer.destroy
    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: 'Your Sellers Account was successfully deleted.' }
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
