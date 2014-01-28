module GatewaySignup
  module Engines
    require 'yaml'

    class Yaml
      def initialize(file)
        @gw_data = YAML.load_file file
      end

      def fields_for(gateway)
        @gw_data[gateway.to_sym][:fields]
      end

      def gateways
        @gw_data.keys
      end

      def details(gateway)
        @gw_data[gateway.to_sym]
      end

      def for_country(country)
        gateways.select { |gw| @gw_data[gw][:countries].include? country }
      end
    end
  end
end