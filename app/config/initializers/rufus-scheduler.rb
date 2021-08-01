
p :RETURN if defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'
return if defined?(Rails::Console) || Rails.env.test? || File.split($0).last == 'rake'


#p :config_initializers_rufus_scheduler
#p [ :console, defined?(Rails::Console) ]
#p [ :Rails, Rails ]
#p [ :Rails_Console, Rails.const_defined?('Console') ]
#puts "---"
#p $0
#p $PROGNAME
#p ARGV
#puts "---"
#puts caller
#puts "---."


require 'rufus-scheduler'

scheduler = Rufus::Scheduler.new

scheduler.every '1s' do
  File.open('scheduler.log', 'wb') do |f|
    f.puts [ :rufus, Time.now ].inspect
  end
end

