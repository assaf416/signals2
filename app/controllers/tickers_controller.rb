class TickersController < ApplicationController
  before_action :set_ticker, only: %i[ show edit update destroy ]

  # GET /tickers or /tickers.json
  def index
    @tickers = Ticker.all
  end

  # GET /tickers/1 or /tickers/1.json
  def show
    Ticker.eod_fundamentals_for_symbol(@ticker.symbol)
    Ticker.yahoo_news_for_symbol(@ticker.symbol)
    @fundamentals = JSON.parse $redis.hget("SIGNIALS-EOD-FUNDAMENTAL",@ticker.symbol)
    @news = JSON.parse $redis.hget("SIGNALS-YAHOO-NEWS",@ticker.symbol)
  end

  # GET /tickers/new
  def new
    @ticker = Ticker.new
  end

  # GET /tickers/1/edit
  def edit
  end

  # POST /tickers or /tickers.json
  def create
    @ticker = Ticker.new(ticker_params)

    respond_to do |format|
      if @ticker.save
        format.html { redirect_to ticker_url(@ticker), notice: "Ticker was successfully created." }
        format.json { render :show, status: :created, location: @ticker }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickers/1 or /tickers/1.json
  def update
    respond_to do |format|
      if @ticker.update(ticker_params)
        format.html { redirect_to ticker_url(@ticker), notice: "Ticker was successfully updated." }
        format.json { render :show, status: :ok, location: @ticker }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickers/1 or /tickers/1.json
  def destroy
    @ticker.destroy

    respond_to do |format|
      format.html { redirect_to tickers_url, notice: "Ticker was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticker
      @ticker = Ticker.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticker_params
      params.require(:ticker).permit(:symbol, :name, :market, :last_price, :last_price_at, :last_change_percent, :ask_size, :bid_size, :ask_price, :bid_price, :sector, :industry, :kind)
    end
end
