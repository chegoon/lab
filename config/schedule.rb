# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
set :output, "log/cron.log"
set :env_path,    '"$HOME/.rbenv/shims":"$HOME/.rbenv/bin"'
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#job_type :rake,   %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec rake :task --silent :output }
job_type :runner, %q{ cd :path && PATH=:env_path:"$PATH" script/rails runner -e :environment ':task' :output }
#job_type :script, %q{ cd :path && PATH=:env_path:"$PATH" RAILS_ENV=:environment bundle exec script/:task :output }

every 12.hours do
	puts "ChannelsWorker.perform_async is called"
	runner "ChannelsWorker.perform_async"
end

every 24.hours do
	puts "RegionsWorker.perform_async is called"
	runner "RegionsWorker.perform_async"
end

every 24.hours do
	puts "TeamsWorker.perform_async is called"
	runner "TeamsWorker.perform_async"
end
