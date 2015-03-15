class CacheHandler

  include Sidekiq::Worker
  delegate :logger, to: Rails

  def perform(params = {})
    Collector.new
  end


end