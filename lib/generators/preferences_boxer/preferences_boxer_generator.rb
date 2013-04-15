module PreferencesBoxer
  module Generators
    class PreferencesBoxerGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.join(File.dirname(__FILE__), 'templates')

      def self.next_migration_number(dirname)
          Time.now.utc.strftime("%Y%m%d%H%M%S")
      end

      def create_migration_file
        migration_template 'create_boxer_table.rb', 'db/migrate/create_boxer_settings.rb'
      end
    end
  end
end