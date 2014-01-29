module GatewaySignup
  module Engines
    require 'yaml'
    require 'pry'

    class Yaml
      def initialize(file)
        @gw_data = YAML.load_file file
      end

      def fields_for(gateway)
       @list = @gw_data[gateway.to_sym][:fields]
       @list.each { |x| x << x[1].split("_").map(&:capitalize).join(" ") }
       @list
      end

      def gateways
        @gw_data.keys
      end

      def gateway_list
        @list = {}
        @gw_data.each do |k, v|
          @list[k] = v[:display_name] 
        end
        @list.to_json.html_safe
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