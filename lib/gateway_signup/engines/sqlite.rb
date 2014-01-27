module GatewaySignup
  module Engines
    require 'sqlite3'

    class Sqlite
      def initialize(args)
        @db = Sqlite3::Database.new args[:db]
      end

      def setup_db(force)
        force ? force_create : soft_create
      end

      def gateways
        results = []

        @db.execute("select * from gateways") do |row|
          results << row[:name]
        end

        results
      end

      def details(gateway)
        
      end

      def fields_for(gateway)
        id = @db.execute "select id from gateways where name = ?", gateway

        @db.execute <<-SQL
          select * from fields
            left outer join gateways_fields
            on gateways_fields.field_id = fields.id
            where gateways_fields.gateway_id = ?;
        SQL
      end


      private

      def force_create
        drop_tables

        create_gateway_table
        create_field_table
        create_gateway_field_table
      end

      def soft_create
        
      end

      def create_gateway_table
        @db.ecexute <<-SQL
          create table if not exists gateways (
            id integer_primary_key,
            name varchar(255),
            country varchar(255),
            display_name varchar(255)
          );
        SQL
      end

      def create_field_table
        @db.execute <<-SQL
          create table if not exists fields (
            id integer_primary_key,
            type varchar(255),
            val varchar(255)
          );
        SQL
      end

      def create_gateway_field_table
        @db.execute <<-SQL
          create table if not exists gateways_fields (
            gateway_id int,
            field_id int
          );
        SQL
      end

      def drop_tables
        @db.execute
      end
    end
  end
end