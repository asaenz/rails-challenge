require 'open-uri'

class Member < ApplicationRecord
  validates :name, presence: true
  validates :website, presence: true

  has_many :friendships
  has_many :friends, :through => :friendships

  before_save :scrape_for_headers


  private
    # Parses all h1, h2, and h3 from the given URL
    def scrape_for_headers
      content = ""
      begin
        doc = Nokogiri::HTML(open(self.website))
        content = doc.css("h1, h2, h3").map { |h| h.text.strip }.join(",")
      rescue SocketError, Errno::ECONNREFUSED, Errno::ENOENT => ex
        logger.error "Website is invalid. Error: #{ex.message}"
      rescue => ex
        logger.error ex.message
      end
      self.website_headers = content
    end
end