require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)
Redis.current = Redis.new(:host => '127.0.0.1', :port => 6379)
module Transport
  class Application < Rails::Application
    config.assets.paths << Rails.root.join("vendor","assets","bower_components")

  end
end
