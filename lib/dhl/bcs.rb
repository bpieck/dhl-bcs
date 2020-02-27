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

    def self.client(config, **opts)
      @namespace.const_get('Client').new(config, **opts)
    end

    def self.build_shipment(**opts)
      @namespace.const_get('Shipment').build(**opts)
    end

    def self.build_shipper(**opts)
      @namespace.const_get('Shipper').build(**opts)
    end

    def self.build_receiver(**opts)
      @namespace.const_get('Receiver').build(**opts)
    end

    def self.build_service(**opts)
      @namespace.const_get('Service').new(**opts)
    end

  end
end
