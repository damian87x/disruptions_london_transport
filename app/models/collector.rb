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
    @parsed_hash =Nori.new(:parser => :nokogiri, :advanced_typecasting => false).parse(respond).first.last["Disruptions"]
  end

  def respond
    @respond = BodyHelper.new.body
  end

  def collect
    uniq_ids_a
    @parsed_hash["Disruption"].map do |disruption|
      save_to_redis(disruption)
    end
  end

  def uniq_ids_a
    @@uniq_ids ||= @exist_disruptions.map(&:uniq_id)
  end


  def prepare(disruption)
    Marshal.dump(OpenStruct.new(disruption))
  end


  def save_to_redis(disruption)
    uniq_id = disruption["@id"]
    Disruption.create(uniq_id: uniq_id) unless self.uniq_ids_a.include? uniq_id
    Redis.current.set("#{uniq_id}_disruptions", prepare(disruption))
  end


end