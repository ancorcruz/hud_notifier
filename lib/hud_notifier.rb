$:.unshift("#{File.dirname(__FILE__)}/hud_notifier")

require 'nokogiri'
require 'open-uri'
require 'active_record'

require 'database'
require 'scraper'
require 'scraper/deal'
require 'models/deal'

module HudNotifier
  extend self

  def scrape(url)
    Database.configure

    hud_deals = Scraper.new(url).deals

    new_deals = []

    hud_deals.each do |hud_deal|
      deal = Deal.new(hud_deal.attributes)
      new_deals << deal if deal.save
    end

    #Notifier.notify(new_deals)
  end
end
