include ApplicationHelper

User.create(:name => "אסף ", :email => "assaf.goldstein@gmail.com", :password => "demo123",
            :password_confirmation => "demo123", :employee => true, :manager => true, :phone_no => "0505928448")



Feed.create(:name => "Yahoo Headlines" , :url => "https://www.yahoo.com/news/rss")
Feed.create(:name => "Investing.com" , :url => "https://www.investing.com/rss/news.rss")
Feed.create(:name => "Market Watch" , :url => "https://www.feedspot.com/infiniterss.php?_src=feed_title&followfeedid=80109&q=site:https%3A%2F%2Ffeeds.marketwatch.com%2Fmarketwatch%2Ftopstories%2F")
Feed.create(:name => "Seeking Alpha" , :url => "https://seekingalpha.com/market_currents.xml")
Feed.create(:name => "Alpha Street" , :url => "https://news.alphastreet.com/feed/")
Feed.create(:name => "Ragin Bull" , :url => "https://ragingbull.com/feed/")
Feed.create(:name => "כלכליסט דך הבית" , :url => "https://www.calcalist.co.il/GeneralRSS/0,16335,L-8,00.xml")

Feed.all.each{|f| f.load_news}

Ticker.load_market

            puts " DONE !"