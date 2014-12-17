require File.dirname(__FILE__) + '/doku/helper.rb'
require File.dirname(__FILE__) + '/doku/notification.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Doku

        TEST_URL = 'http://103.10.129.17/Suite/Receive'
        LIVE_URL = 'https://pay.doku.com/Suite/Receive'

        def self.service_url
          ActiveMerchant::Billing::Base.integration_mode == :test ? TEST_URL : LIVE_URL
        end

        def self.notification(post, options = {})
          Notification.new(post, options)
        end

        def self.return(post, options = {})
          Return.new(post, options)
        end

      end
    end
  end
end
