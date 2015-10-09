module HudNotifier
  class Scraper
    class Deal
      def initialize(data)
        @data = data
      end

      def attributes
        {
          hud_id: hud_id,
          title: title,
          url: url
        }
      end

      private

      attr_reader :data

      def title
        header.text.strip
      end

      def hud_id
        data.attributes['data-thread-id'].value
      end

      def url
        "http://www.hotukdeals.com#{href}"
      end

      def href
        header.first.attributes['href'].value
      end

      def header
        @header ||= data.search(".thread-title-text")
      end
    end
  end
end
