module Lita
  class Asimo
    def self.message(string)
      %x(curl --data "event=message&content=#{Rails.env.development? ? '[DEV] ' + string : '[PROD] ' + string}" https://#{ENV['FLOWDOCK_API_KEY']}@api.flowdock.com/flows/rpc/production-log/messages)
    end
  end
end