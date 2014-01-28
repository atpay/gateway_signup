module GatewaySignup
  class Registry
    def initialize(args)
      @config = ConfigEngine.source args[:format], args[:location]
    end

    def setup_sqlite(force)
      @config.setup_db force
    end

    def gateways
      @config.gateways
    end

    def fields_for(gateway)
      @config.fields_for gateway
    end

    def details(gateway)
      @config.details gateway
    end

    def for_country(country)
      @config.for_country country
    end
  end
end