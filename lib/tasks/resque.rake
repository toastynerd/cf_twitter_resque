require 'resque/tasks'
require 'resque_scheduler/tasks'

namespace :resque do
  task :setup => :environment do
    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'

    Resque.redis = '192.168.1.4:6379'

    Resque::Scheduler.dynamic = true

    require 'send_to_twitter'
    require 'twitter'
  end
end
