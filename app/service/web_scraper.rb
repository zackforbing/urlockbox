require 'nokogiri'

class WebScraper
  def initialize(url)
    @page = Nokogiri::HTML(open(url))
  end

  def page_h1
    @page.css('h1').text
  end

  def page_title
    @page.css('title').text
  end
