class Link < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true, url: true
  validates :read, default: false

  def check_title(title)
    if title.include?("\\cc")
      LinkMailer.link_email
end
