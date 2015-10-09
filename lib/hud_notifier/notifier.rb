module HudNotifier
  class Notifier
    def initialize(deals)
      @deals = deals
    end

    def notify
      Pony.mail(
        {
          to: ENV['NOTIFY_EMAIL'],
          subject: subject,
          body: body,
        }
      )
    end

    private

    def subject
      "[#{Time.now}] Pist! There are new offers from HUD Notifier"
    end

    def body
      @deals.map { |deal| "#{deal.title} => #{deal.url}" }.join("\n")
    end
  end
end
