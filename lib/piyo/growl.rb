require 'growl'

module Piyo
  class Growl
    class << self
      def icon
        "#{File.dirname(__FILE__)}/../../resources/sofuji.png"
      end

      def sticky_terms
        ENV['STICKY'] ||= "important,critical,urgent"
        @@sticky_terms ||= ENV['STICKY'].split(",")
      end
      
      def notify(title, message)
        sticky = false
        sticky_terms.each do |term|
          sticky = true if title.downcase.include?(term) || message.downcase.include?(term)
        end

        ::Growl.notify(message,
                       :title   => title,
                       :icon    => icon,
                       :sticky => sticky)
      end

      def defaultMessage
        notify("Example", "You clicked! Good job!")
      end

      def bushido_growl(notification)
        notification = notification['notification']
        notify("#{notification['app_name']} | #{notification['title']}", "#{notification['body']}")
      end
    end
  end
end
