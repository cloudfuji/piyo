require "piyo/version"
require "piyo/poller"
require "piyo/growl"


module Piyo
  class Notifier
    def start
      @bushido_url = ENV['BUSHIDO_URL'] || "http://bushi.do"
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
      recent_highest_id = new_notifications.collect { |item| item['notification']['id'].to_i }.sort.last || @last_id

      new_notifications = new_notifications[-5..-1] if first_time
      new_notifications.each { |notification| Growl.bushido_growl(notification) }

      if recent_highest_id > @last_id
        @last_id = recent_highest_id 
        puts "Highest id: #{@last_id}"
      end
    end
  end
end
