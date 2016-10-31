require 'uri'

class Link < ApplicationRecord
  validates :title, presence: true
  validates :url, presence: true
  validates :read, default: false


  def valid?(url)
    uri = URI.parse(url)
    uri.kind_of?(URI::HTTP)
    rescue URI::InvalidURIError
    false
  end
end
