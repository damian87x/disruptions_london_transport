class Disruption < ActiveRecord::Base

 extend RedisHelper

  class << self

    def find_all
      load(get(all_key))
    end

    def find_with_id(uniq_id)
      load(get(uniq_key(uniq_id)))
    end

    def convert(dir)
      {
              lng: dir.CauseArea['DisplayPoint']['Point']['coordinatesLL']
      }
    end

  end


  def get
    Disruption.find_with_id uniq_id
  end


end
