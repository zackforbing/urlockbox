require 'nokogiri'

class WebScraper
  def initialize(url)
    @doc = Nokogiri::HTML(open(url))
  end

  def page_h1
    @doc.css('h1').text
  end

  def page_title
    @doc.css('title').text
  end
end
