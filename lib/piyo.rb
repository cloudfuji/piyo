puts "WTF"
require "piyo/version"
require "piyo/poller"
require "piyo/growl"


module Piyo
  class Notifier
    puts "Defining start"
    def start
      @config = Piyo::Config.load rescue {}

      @bushido_url = "http://bushi.do"
      @auth_token  = ENV['AUTH_TOKEN']
      @last_id     = 0
      first_time   = true

      while true
        poll_and_notify(first_time)
        first_time = false
        sleep 30
      end
    end


    def poll_and_notify(first_time)
      new_notifications = Piyo::BushidoPoller.poll(@bushido_url, @auth_token, @last_id)
      recent_highest_id = new_notifications.collect { |item| puts item.inspect; puts '-';item['notification']['id'].to_i }.sort.last || @last_id

      new_notifications = new_notifications[-5..-1] if first_time
      new_notifications.each { |notification| Growl.bushido_growl(notification) }

      @last_id = recent_highest_id if recent_highest_id > @last_id

      @config['last_notification_id'] = @last_id
      puts "Highest id: #{@last_id}"
    end
  end
end
