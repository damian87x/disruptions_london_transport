class Disruption < ActiveRecord::Base

  include RedisHelper

  class << self

    def find_all
      Disruption.all.map do |d|
        find_with_id(self.key_redis(d.uniq_id))
      end
    end

    def find_with_id(uniq_id)
      Marshal.load(Redis.current.get(key_redis(uniq_id)))
    end

    def key_redis(uniq_id)
      "#{uniq_id}_disruptions"
    end

  def convert(dir)
    {
            lat: dir.CauseArea['DisplayPoint']['Point']['coordinatesEN'],

            lng: dir.CauseArea['DisplayPoint']['Point']['coordinatesLL']
    }
  end

  end


  def get
    Disruption.find_with_id uniq_id
  end


end
