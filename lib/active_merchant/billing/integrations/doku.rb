require File.dirname(__FILE__) + '/doku/helper.rb'
require File.dirname(__FILE__) + '/doku/notification.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Doku

        def self.service_url
          'https://apps.myshortcart.com/payment/request-payment/'
        end

        def self.notification(post)
          Notification.new(post)
        end

        def self.return(post)
          Return.new(post)
        end

      end
    end
  end
end
