class Feed < ApplicationRecord

    require "open-uri"
    require 'simple-rss'
  def load_news

        rss = SimpleRSS.parse HTTParty.get(self.url).body 
        for i in rss.items do 
            begin
                puts "TITLE    : #{i[:title]}"
                puts "GUID     : #{i[:guid]}"
                puts "CHANNEL     : #{rss.channel.title}"
                puts "AUTHOR     : #{i[:author]}"
                puts "PUBLISHED: #{i[:pubDate]}"
                puts "IMAGE    : #{i[:image]}"
                puts "MESSAGE  : #{i[:description]}"
                puts "LINK     : #{i[:link]}"
                puts " -- "
                if Article.find_by_guid(i[:guid]).nil?
                    Article.create(:feed_id => self.id , :guid => i[:guid], :channel => rss.channel.title , :title => i[:title] ,
                        :published_at => i[:pubDate] , :link => i[:link], :message => i[:description] , :author => i[:author])
                    
                end 
            rescue 
            next
        end
        end 
      #feed = RSS::Parser.parse(rss)

      #puts "Title: #{feed.channel.title}"
      #feed.items.each do |item|
      #  puts "Item: #{item.title}"
      #end
      return nil
  end
end
