class BodyHelper

  attr_reader :body

  def initialize(url = nil)
    @url = url
    @body = get_body
  end


   private

  def get_body
    Net::HTTP.get(URI.parse(url_for))
  end


  def url_for
   @url  ||=  default_path
  end

  def default_path
    "http://data.tfl.gov.uk/tfl/syndication/feeds/tims_feed.xml?app_id=#{APP_CONFIG[:auth][:app_id]}&app_key=#{APP_CONFIG[:auth][:app_key]}"
  end

end





