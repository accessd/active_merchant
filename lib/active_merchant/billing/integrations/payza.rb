require File.dirname(__FILE__) + '/payza/helper.rb'
require File.dirname(__FILE__) + '/payza/notification.rb'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Payza

        mattr_accessor :test_url
        self.test_url = 'https://sandbox.Payza.com/sandbox/payprocess.aspx'

        mattr_accessor :production_url
        self.production_url = 'https://secure.payza.com/checkout'

        mattr_accessor :ipt_test_url
        self.ipt_test_url = 'https://sandbox.Payza.com/sandbox/IPN2.ashx'

        mattr_accessor :ipn_production_url
        self.ipn_production_url = 'https://secure.payza.com/ipn2.ashx'

        def self.service_url
          mode = ActiveMerchant::Billing::Base.integration_mode
          case mode
          when :production
            self.production_url
          when :test
            self.test_url
          else
            raise StandardError, "Integration mode set to an invalid value: #{mode}"
          end
        end

        def self.notification_confirmation_url
          mode = ActiveMerchant::Billing::Base.integration_mode
          case mode
          when :production
            self.ipn_production_url
          when :test
            self.ipt_test_url
          else
            raise StandardError, "Integration mode set to an invalid value: #{mode}"
          end
        end

        def self.notification(post)
          Notification.new(post)
        end
      end
    end
  end
end
