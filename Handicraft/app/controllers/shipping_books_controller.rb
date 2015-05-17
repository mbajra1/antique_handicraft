class ShippingBooksController < ApplicationController
  before_action :set_shipping_book, only: [:show, :edit, :update, :destroy]

  # GET /shipping_books
  # GET /shipping_books.json
  def index

     #session.delete(:shipping_book_id)

     session[:shipping_book_id]= nil
    #@shipping_books = ShippingBook.all
    email_id=current_user.email
    customer = Customer.find_by_email(email_id)

    @customer_id=customer.customer_id
    @shipping_books = ShippingBook.where(customer_id: @customer_id)

  end

  # GET /shipping_books/1
  # GET /shipping_books/1.json
  def show
  end

  # GET /shipping_books/new
  def new
    @customer_id=@customer_id
    @shipping_book = ShippingBook.new
  end

  # GET /shipping_books/1/edit
  def edit
  end

  # POST /shipping_books
  # POST /shipping_books.json
  def create
    @shipping_book = ShippingBook.new(shipping_book_params)

    respond_to do |format|
      if @shipping_book.save
        format.html { redirect_to @shipping_book, notice: 'Shipping address in Shipping book was successfully created.' }
        format.json { render :show, status: :created, location: @shipping_book }
      else
        format.html { render :new }
        format.json { render json: @shipping_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipping_books/1
  # PATCH/PUT /shipping_books/1.json
  def update
    respond_to do |format|
      if @shipping_book.update(shipping_book_params)
        format.html { redirect_to @shipping_book, notice: 'Shipping address in Shipping book was successfully updated.' }
        format.json { render :show, status: :ok, location: @shipping_book }
      else
        format.html { render :edit }
        format.json { render json: @shipping_book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shipping_books/1
  # DELETE /shipping_books/1.json
  def destroy
    @shipping_book.destroy
    respond_to do |format|
      format.html { redirect_to shipping_books_url, notice: 'Shipping address inShipping book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_book
      @shipping_book = ShippingBook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipping_book_params
      params.require(:shipping_book).permit(:shipping_book_id, :customer_id, :shipping_name, :shipping_address, :shipping_city, :shipping_state_province, :shipping_zip_postal, :shipping_country_region)
    end
end
