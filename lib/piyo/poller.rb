require 'rubygems'
require 'rest-client'
require 'json'

module Piyo
  class BushidoPoller
    @@notifications = []

    def self.poll(bushido_url, auth_token, last_id)
      puts "Retrieving new notifications..."
      
      begin
        _notifications = JSON(RestClient.get("#{bushido_url}/notifications.json",
                                             {:params =>
                                               {:auth_token => auth_token,
                                                 :last_id => last_id}}))
        
        _new = []
        if _notifications
          _notifications.each do |notification|
            id = notification['notification']['id']
            if !@@notifications.include?(id)
              _new << notification
              @@notifications << id
            end
          end
        end
        
        puts "Finished!"
        
        return _new
      rescue => e
        puts e
        return []
      end
    end
  end
end
