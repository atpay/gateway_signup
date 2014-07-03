module GatewaySignup
  class ConfigEngine
    class << self
      def source(type, options)
        case type
        when :yaml
          require File.dirname(File.absolute_path __FILE__) + '/engines/yaml'
          Engines::Yaml.new(options)
        else
          raise "Bad Source Type: #{type}"
        end
      end
    end
  end
end                                                                                                                                                                                                                                                                                                                                                                                                                                      
