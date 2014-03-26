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
       @list
      end

      def gateways
        @gw_data.keys
      end

      def countries
        @count=[]
        @gw_data.each do |k, v|
          @count = @count + v[:countries]
        end
        @count = @count.uniq.sort
        us = @count.index('US')
        @count.delete_at(us)
        @count = @count.unshift('US')
        @count.to_json.html_safe
      end

      def gateway_list
        @list = hash_tree
        @gw_data.each do |k, v|
          @list[k]["display"] = v[:display_name]
          @list[k]["countries"] = v[:countries]
        end
        @list.to_json.html_safe
      end

      def details(gateway)
        @gw_data[gateway.to_sym]
      end

      def for_country(country)
        gateways.select { |gw| @gw_data[gw][:countries].include? country }
      end

      def hash_tree
        Hash.new do |hash, key|
          hash[key] = hash_tree
        end
      end

    end
  end
end