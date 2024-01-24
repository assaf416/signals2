class Ticker < ApplicationRecord
    require 'simple-rss'
    require 'open-uri'
    require 'active_support/core_ext/hash'  #from_xml 
    require 'nokogiri'

    def self.load_market 
        for item in  Ticker.polygon_tickers do
            symbol = item["ticker"]
            t =  Ticker.find_by_symbol(symbol)
            t = Ticker.create(:symbol => symbol , :name => item["name"], :kind => item["type"]) if t.nil?
            m1_candles = Ticker.polygon_1_min_candles_for_symbol_in_date(t.symbol,(Time.now - 1.day).strftime("%Y-%m-%d"))
            m5_candles = Ticker.polygon_5_min_candles_for_symbol_in_date(t.symbol,(Time.now - 1.day).strftime("%Y-%m-%d"))
            news = Ticker.yahoo_news_for_symbol(t.symbol)
            t.m1_candles = m1_candles.to_json
            t.m5_candles = m5_candles.to_json
            t.news = news.to_json
            t.info = Ticker.polygon_ticker_info(t.symbol).to_json 
            t.ticker_info = item.to_json 
            t.save
        end 
    end     

    def self.polygon_tickers 
        @tickers = {}
        res = HTTParty.get("https://api.polygon.io/v3/reference/tickers?type=CS&market=stocks&active=true&apiKey=2uKb9PZGcqqcXhus3TNPaUQv52TOpY4D").body
        res1 =  JSON.parse(res).to_hash
        return res1["results"]
    end 

    def self.polygon_ticker_info(symbol) 
        res = HTTParty.get("https://api.polygon.io/v3/reference/tickers/#{symbol}?apiKey=2uKb9PZGcqqcXhus3TNPaUQv52TOpY4D").body
        res1 =  JSON.parse(res).to_hash
        return res1["results"]
    end 

    def self.polygon_daily_candles_for_date(date) 
        res = HTTParty.get("https://api.polygon.io/v2/aggs/grouped/locale/us/market/stocks/#{date}?adjusted=true&apiKey=2uKb9PZGcqqcXhus3TNPaUQv52TOpY4D").body
        res1 =  JSON.parse(res).to_hash
        return res1["results"]
    end 

    def self.polygon_1_min_candles_for_symbol_in_date(symbol,date) 
        res = HTTParty.get("https://api.polygon.io/v2/aggs/ticker/AAPL/range/1/minute/#{date}/#{date}?adjusted=true&sort=asc&limit=120&apiKey=2uKb9PZGcqqcXhus3TNPaUQv52TOpY4D").body
        res1 =  JSON.parse(res).to_hash
        return res1["results"]
    end 
    def self.polygon_5_min_candles_for_symbol_in_date(symbol,date) 
        res = HTTParty.get("https://api.polygon.io/v2/aggs/ticker/AAPL/range/5/minute/#{date}/#{date}?adjusted=true&sort=asc&limit=1000&apiKey=2uKb9PZGcqqcXhus3TNPaUQv52TOpY4D").body
        res1 =  JSON.parse(res).to_hash
        return res1["results"]
    end 

    def self.polygon_market_snapshot 
        res = HTTParty.get("https://api.polygon.io/v2/snapshot/locale/us/markets/stocks/tickers?apiKey=2uKb9PZGcqqcXhus3TNPaUQv52TOpY4D").body
        res1 =  JSON.parse(res).to_hash
        return res1["results"]
    end 



    def self.feedzira_yahoo_for_symbol(symbol)
      list = []
      url = "http://feeds.finance.yahoo.com/rss/2.0/headline?s='#{symbol}'&region=US&lang=en-US"
      xml = HTTParty.get(url,{headers: {'User-agent': 'Mozilla/5.0'}}).body
      Feedjira.parse(xml).entries.each do |entry|
        list << entry
      end
      list
    end 

    def self.yahoo_headlines
        list = []
        xml = HTTParty.get("https://finance.yahoo.com/news/rssindex",{:headers => {'User-agent': 'Mozilla/5.0'} }).body # if your xml is in the 'data.xml' file
        res = Hash.from_xml(xml)
        res
      end

      def self.yahoo_news_for_symbol(symbol)
        list = []
        xml = HTTParty.get("https://feeds.finance.yahoo.com/rss/2.0/headline?s=#{symbol}&region=US&lang=en-US",
        {
          headers: {'User-agent': 'Mozilla/5.0'}
         }).body
         puts xml.inspect
        # begin
          res = Hash.from_xml(xml.gsub("\n",""))
          res
        # rescue 
        #   xml
        # end 
      end
    
end
