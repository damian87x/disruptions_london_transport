module RedisHelper

  def uniq_key(uniq_id)
    "#{uniq_id}_disruptions"
  end

  def all_key
    'disruptions'
  end

  def save
    lambda {|key,target| Redis.current.set(key, target) }
  end

  def get(key)
    Redis.current.get(key)
  end

  def prepare(target)
    dump(target)
  end

  def dump(target)
    Marshal.send(__method__, target)
  end

  def load(target)
    Marshal.send(__method__, target)
  end


end
