class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :device
    def device
        agent = request.user_agent
        @device = "Desktop"
        @device = "Mobile" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i 
        @device = "Mobile" if agent =~ /Mobile/
      end  
      
      def mobile?
        @device == "Mobile"
      end 
end
