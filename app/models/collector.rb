class Collector
  include RedisHelper
  attr_reader :parsed_hash

  @@uniq_ids = nil

  def initialize
    @parsed_hash = parse_xml
    @respond = nil
    @exist_disruptions = Disruption.all
    collect
  end

  def parse_xml
    @parsed_hash = Nori.new(:parser => :nokogiri, :advanced_typecasting => false).parse(respond)
  end

  def respond
    @respond = BodyHelper.new.body
  end

  def collect
    disruptions.each do |disruption|
      save_to_redis_by_one(disruption)
    end
    save_all
  end

  def uniq_ids_a
    @@uniq_ids ||= @exist_disruptions.map(&:uniq_id)
  end

  def clear
    @@uniq_ids = nil
  end

  private

  def disruptions
    @parsed_hash['Root']['Disruptions']['Disruption']
  end



  def save_to_redis_by_one(disruption)
    uniq_id = disruption['@id']
    Disruption.create(uniq_id: uniq_id) unless self.uniq_ids_a.include? uniq_id
    save.call(uniq_key(uniq_id), prepare(disruption))
  end

  def save_all
    save.call(all_key, prepare(disruptions))
  end



end