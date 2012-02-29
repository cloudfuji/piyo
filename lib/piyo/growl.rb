require 'growl'

module Piyo
  class Growl
    class << self
      def icon
        "#{File.dirname(__FILE__)}/../../resources/sofuji.png"
      end
      
      def notify(title, message)
        sticky = title.downcase.include?("sean") || message.downcase.include?("sean")

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
