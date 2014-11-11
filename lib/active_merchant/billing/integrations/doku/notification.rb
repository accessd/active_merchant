require 'net/http'

module ActiveMerchant #:nodoc:
  module Billing #:nodoc:
    module Integrations #:nodoc:
      module Doku
        class Notification < ActiveMerchant::Billing::Integrations::Notification

          self.production_ips = ['103.10.129.17', '103.10.129.9']
          SUCCESS_RESPONSE_CODE = '0000'

          def complete?
            status.present?
          end

          def item_id
            params['TRANSIDMERCHANT']
          end

          def gross
            params['AMOUNT']
          end

          def status
            params['RESULTMSG']
          end

          def response_code
            params['RESPONSECODE']
          end

          def success_response
            'CONTINUE'
          end

          def currency
            'IDR'
          end

          def transaction_id
            params['TRANSIDMERCHANT']
          end

          def acknowledge(authcode = nil)
            response_code == SUCCESS_RESPONSE_CODE
          end
        end
      end
    end
  end
end
