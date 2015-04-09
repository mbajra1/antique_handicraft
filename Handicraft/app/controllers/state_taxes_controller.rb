class StateTaxesController < ApplicationController
  before_action :set_state_tax, only: [:show, :edit, :update, :destroy]

  # GET /state_taxes
  # GET /state_taxes.json
  def index
    @state_taxes = StateTax.all
  end

  # GET /state_taxes/1
  # GET /state_taxes/1.json
  def show
  end

  # GET /state_taxes/new
  def new
    @state_tax = StateTax.new
  end

  # GET /state_taxes/1/edit
  def edit
  end

  # POST /state_taxes
  # POST /state_taxes.json
  def create
    @state_tax = StateTax.new(state_tax_params)

    respond_to do |format|
      if @state_tax.save
        format.html { redirect_to @state_tax, notice: 'State tax was successfully created.' }
        format.json { render :show, status: :created, location: @state_tax }
      else
        format.html { render :new }
        format.json { render json: @state_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /state_taxes/1
  # PATCH/PUT /state_taxes/1.json
  def update
    respond_to do |format|
      if @state_tax.update(state_tax_params)
        format.html { redirect_to @state_tax, notice: 'State tax was successfully updated.' }
        format.json { render :show, status: :ok, location: @state_tax }
      else
        format.html { render :edit }
        format.json { render json: @state_tax.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /state_taxes/1
  # DELETE /state_taxes/1.json
  def destroy
    @state_tax.destroy
    respond_to do |format|
      format.html { redirect_to state_taxes_url, notice: 'State tax was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_state_tax
      @state_tax = StateTax.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def state_tax_params
      params.require(:state_tax).permit(:state_code, :tax_rate)
    end
end
