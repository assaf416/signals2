require "rufus-scheduler"
require "rake"

scheduler = Rufus::Scheduler.new

# ...
return if defined?(Rails::Console) || Rails.env.test? || File.split($PROGRAM_NAME).last == "rake"

scheduler.every "2m" do
end


