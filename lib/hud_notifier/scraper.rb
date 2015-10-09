module HudNotifier
  class Scraper
    def initialize(url)
      @url = url
    end

    def deals
      document.search(".thread").map { |raw_deal|
        Deal.new(raw_deal)
      }
    end

    def inspect
      deals.each do |deal|
        puts [deal.title, deal.url, deal.hud_id].inspect
      end
    end

    private

    def document
      @document ||= Nokogiri.HTML(open(@url))
    end
  end
end
