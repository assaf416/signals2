include ApplicationHelper

User.create(:name => "אסף ", :email => "assaf.goldstein@gmail.com", :password => "demo123",
            :password_confirmation => "demo123", :employee => true, :manager => true, :phone_no => "0505928448")

puts " DONE !"