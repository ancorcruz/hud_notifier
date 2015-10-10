module HudNotifier
  class Notifier
    def initialize(deals)
      @deals = deals
    end

    def self.send(deals)
      new(deals).send
    end

    def send
      Pony.mail(
        {
          to: ENV['NOTIFY_EMAIL'],
          subject: subject,
          body: body,
          html_body: html_body,
        }
      )
    end

    private

    def subject
      "Psst! There are new deals for you"
    end

    def body
      @deals.map { |deal| "#{deal.title} [#{deal.url}]" }.join("\r\n\r\n")
    end

    def html_body
      ERB.new(html_template).result(binding)
    end

    def html_template
      %{
        <p>New deals: <%= Time.now.strftime "%e %B, %Y - %k:%M" %></p>

        <p>
          <ul>
            <% @deals.each do |deal| %>
              <li><a href="<%= deal.url %>"><%= deal.title %></a></li>
            <% end %>
          </ul>
        </p>
      }
    end
  end
end
