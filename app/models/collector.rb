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
    uniq_ids_a
    array = disruptions.map {|disruption| save_one(disruption) }
    save_all(array)
  end

  def uniq_ids_a
    @@uniq_ids ||= @exist_disruptions.map(&:uniq_id)
  end

  def clear
    @@uniq_ids = nil
  end

  private

  def coordinates(attrs)
   a =  attrs['CauseArea']['DisplayPoint']['Point']['coordinatesLL'].split(',')
   { longitude: a[0], latitude: a[1]}
  end

  def disruptions
    @parsed_hash['Root']['Disruptions']['Disruption']
  end

  def exist_uniq?(disruption)
    !@@uniq_ids.blank? && @@uniq_ids.inclue?(disruption['@id'])
  end


  def save_one(disruption)
    created = Disruption.where(uniq_id: disruption['@id']).update_or_create(prepare_attrs(disruption))
    save.call(uniq_key(created.uniq_id), prepare(created))
    created
  end

  def save_all(array)
    save.call(all_key, prepare(array))
  end



end