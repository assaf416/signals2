class FeedController < ApplicationController
  layout "feed"
  def index
  end

  def home
  end 

  def ticker
    @ticker = Ticker.find_by_symbol(params[:s])
    @ticker = Ticker.create(:symbol => params[:s] ) if @ticker.nil?
    Ticker.eod_fundamentals_for_symbol(@ticker.symbol)
  end 

  def tickers 
    @tickers = []

    $redis.hgetall("SIGNALS-POLYGON-QUOTES").each{|symbol, res| 
      jres = JSON.parse res
    @tickers << { :symbol => symbol , 
      :change_day_percents => jres["todaysChangePerc"] ,
      :change_day => jres["todaysChangePerc"] ,
     :last_price => jres["lastTrade"]["p"], 
     :last_traded_at => Time.at(jres["lastTrade"]["t"].to_i / 1000000000)
    } 
  }
  end 

  def chat
  end

  def calendar
  end

  def meeting
  end
  
  def groups
  end

  def group
  end

  def customers
  end

  def screeners 
    @screeners = [
      {:name => "Reporting Today" , :conditions => "" , :results => "AA,IBKR,AMD"},
      {:name => "Losing Today" , :conditions => "" , :results => "AA,IBKR,AMD"},
      {:name => "Winning Today" , :conditions => "" , :results => "AA,IBKR,AMD"},
      {:name => "RSI CROSSED OVER 85" , :conditions => "" , :results => "AA,IBKR,AMD"},
    ]
  end 

  def robots 
    Ticker.polygon_market_snapshot
    @robots = [
      {:name => "Sell High Buy Low" , :backtests => 100 , :avg_profit => "1.23%" , :results => "AA,IBKR,AMD"},
      {:name => "AVARAGE TEST" , :backtests => 100 , :avg_profit => "1.23%" , :results => "AA,IBKR,AMD"}
    ]
  end 


  def news
    $redis.hgetall("SIGNALS-YAHOO-NEWS").each{|symbol,json| 
      @news = []
      res = JSON.parse json
      for item in res["rss"]["channel"]["item"]
        @news << {:title => item["title"], :message => item["description"]}
      end 

  }
  @articles = Article.all
  end
end
