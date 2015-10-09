$:.unshift("#{File.dirname(__FILE__)}/hud_notifier")

require 'nokogiri'
require 'open-uri'
require 'active_record'
require 'pony'

require 'database'
require 'mailer_config'
require 'scraper'
require 'scraper/deal'
require 'models/deal'
require 'notifier'

HudNotifier::Database.configure

module HudNotifier
  extend self

  def scrape(url)

    hud_deals = Scraper.new(url).deals

    new_deals = []

    hud_deals.each do |hud_deal|
      deal = Deal.new(hud_deal.attributes)
      new_deals << deal if deal.save
    end

    Notifier.new(new_deals).notify unless new_deals.empty?
  end
end
