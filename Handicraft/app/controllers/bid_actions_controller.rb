class BidActionsController < ApplicationController
  before_action :set_bid_action, only: [:show, :edit, :update, :destroy]

  @@time_out=Time.now

  # GET /bid_actions
  # GET /bid_actions.json
  def index
    @bid_actions = BidAction.all
  end

  # GET /bid_actions/1
  # GET /bid_actions/1.json
  def show
  end

  # GET /bid_actions/new
  def new
    @bid_action = BidAction.new
  end

  # GET /bid_actions/1/edit
  def edit
  end

  # POST /bid_actions
  # POST /bid_actions.json
  def create



    @bid_cart=BidCart.all

    @bid_cart.each do |bid_cart|
      @opening_price=bid_cart.opening_price
    end

    bid_amount=params[:bid_action][:bid_amount].to_f

    highest_bid_amount=BidAction.maximum(:bid_amount)

    if(highest_bid_amount==nil)
      highest_bid_amount=0.00
    end
    time_now =Time.now
    time_diff=time_now -@@time_out


    if((bid_amount>highest_bid_amount)&&(bid_amount>@opening_price))
      #if(bid_end_time !=@time_out)
      if((time_diff/60)<=1)
        @bid_action = BidAction.new(bid_action_params)

        respond_to do |format|
        if @bid_action.save
          format.html { redirect_to @bid_action, notice: 'Bid action was successfully created.' }
          format.json { render :show, status: :created, location: @bid_action }
        else
          format.html { render :new }
          format.json { render json: @bid_action.errors, status: :unprocessable_entity }
        end
        end

      else
        flash[:notice]='Sorry, the bid has now ended'
        decide_winner
      end
    else
      flash[:notice]='Please enter a amount higher than current highest amount and opening price'
    end
  end

  # PATCH/PUT /bid_actions/1
  # PATCH/PUT /bid_actions/1.json
  def update
    respond_to do |format|
      if @bid_action.update(bid_action_params)
        format.html { redirect_to @bid_action, notice: 'Bid action was successfully updated.' }
        format.json { render :show, status: :ok, location: @bid_action }
      else
        format.html { render :edit }
        format.json { render json: @bid_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bid_actions/1
  # DELETE /bid_actions/1.json
  def destroy
    @bid_action.destroy
    respond_to do |format|
      format.html { redirect_to bid_actions_url, notice: 'Bid action was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bid_action
      @bid_action = BidAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_action_params
      params.require(:bid_action).permit(:bidder_id, :bid_amount, :bid_cart_id)
    end



  def decide_winner
    max_amount=BidAction.maximum(:bid_amount)
    #aution_winner=Message.where(bid_amount: max_amount)

    #@aution_winner=Message.where("bid_amount= '#{max_amount}'")

    # @aution_winner=Message.all
    @all_bid_actions=BidAction.all
    @winner=''
    @all_bid_actions.each do |winner|
      if(winner.bid_amount==max_amount)
        winners=winner.bidder_id
        flash[:notice]='Winner is '+winner.bidder_id
      end
      # flash[:notice]='Winner is '+winner.bidder
    end

    flash[:notice]='Winner is '+@winner
    @@bid_winner=@winner
    @session_user=session[:user_id]
    #winner_id='bid_'+bid_cart_id+'_winner'
    session[:winner_id]=@winner
    session[:wining_amount]=max_amount
    #@bid_cart=BidCart.where(id: bid_cart_id)

  end


end
