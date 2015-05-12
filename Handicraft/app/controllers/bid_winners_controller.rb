class BidWinnersController < ApplicationController
  before_action :set_bid_winner, only: [:show, :edit, :update, :destroy]

  # GET /bid_winners
  # GET /bid_winners.json
  def index
    @bid_winners = BidWinner.all
  end

  # GET /bid_winners/1
  # GET /bid_winners/1.json
  def show
  end

  # GET /bid_winners/new
  def new
    @bid_winner = BidWinner.new
  end

  # GET /bid_winners/1/edit
  def edit
  end

  # POST /bid_winners
  # POST /bid_winners.json
  def create
    @bid_winner = BidWinner.new(bid_winner_params)

    respond_to do |format|
      if @bid_winner.save
        format.html { redirect_to @bid_winner, notice: 'Bid winner was successfully created.' }
        format.json { render :show, status: :created, location: @bid_winner }
      else
        format.html { render :new }
        format.json { render json: @bid_winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bid_winners/1
  # PATCH/PUT /bid_winners/1.json
  def update
    respond_to do |format|
      if @bid_winner.update(bid_winner_params)
        format.html { redirect_to @bid_winner, notice: 'Bid winner was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid_winner }
      else
        format.html { render :edit }
        format.json { render json: @bid_winner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bid_winners/1
  # DELETE /bid_winners/1.json
  def destroy
    @bid_winner.destroy
    respond_to do |format|
      format.html { redirect_to bid_winners_url, notice: 'Bid winner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_winner
      @bid_winner = BidWinner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_winner_params
      params.require(:bid_winner).permit(:winner_id, :bid_product, :winning_amount, :bid_cart_id)
    end
end
