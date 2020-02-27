require 'dhl/bcs/version'
require 'dhl/bcs/errors'
require 'dhl/bcs/v2/client'
require 'dhl/bcs/v2/buildable'
require 'dhl/bcs/v2/shipment'
require 'dhl/bcs/v2/shipper'
require 'dhl/bcs/v2/receiver'
require 'dhl/bcs/v2/communication'
require 'dhl/bcs/v2/location'
require 'dhl/bcs/v2/address'
require 'dhl/bcs/v2/packstation'
require 'dhl/bcs/v2/parcel_shop'
require 'dhl/bcs/v2/postfiliale'
require 'dhl/bcs/v2/bank_data'
require 'dhl/bcs/v2/service'
require 'dhl/bcs/v2/locator'
require 'dhl/bcs/v2/export_document'

require 'dhl/bcs/v3/client'
require 'dhl/bcs/v3/buildable'
require 'dhl/bcs/v3/shipment'
require 'dhl/bcs/v3/shipper'
require 'dhl/bcs/v3/receiver'
require 'dhl/bcs/v3/communication'
require 'dhl/bcs/v3/location'
require 'dhl/bcs/v3/address'
require 'dhl/bcs/v3/packstation'
require 'dhl/bcs/v3/parcel_shop'
require 'dhl/bcs/v3/postfiliale'
require 'dhl/bcs/v3/bank_data'
require 'dhl/bcs/v3/service'
require 'dhl/bcs/v3/locator'
require 'dhl/bcs/v3/export_document'

module Dhl
  module Bcs
    @namespace = V3

    def self.version=(version_string)
      @namespace = case version_string.downcase
                   when 'v2'
                     V2
                   else
                     V3
                   end
    end

    def self.client(config, options = {})
      @namespace.const_get('Client').new(config, options)
    end

    def self.build_shipment(*args)
      @namespace.const_get('Shipment').build(*args)
    end

    def self.build_shipper(*args)
      @namespace.const_get('Shipper').build(*args)
    end

    def self.build_receiver(*args)
      @namespace.const_get('Receiver').build(*args)
    end

    def self.build_service(*args)
      @namespace.const_get('Service').new(*args)
    end

  end
end
