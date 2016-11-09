class Link < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true, url: true
  validates :read, default: false
  before_save :set_scraped_html_summary

  def set_scraped_html_summary
    scraper = WebScraper.new(url)
    self.summary_h1 = scraper.page_h1
    self.summary_title = scraper.page_title
  end
end
