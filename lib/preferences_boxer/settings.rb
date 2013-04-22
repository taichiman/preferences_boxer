require 'singleton'
require 'preferences_boxer/yaml_store'
require 'preferences_boxer/store_store'

module PreferencesBoxer

  def self.store_type= v
      @store_type = v
  end

  def self.store_type
      @store_type
  end

  class Settings 
    include Singleton

    def initialize
      #TODO Если начальная установка, то наверное заполняем сеттинги стандартными значениями
      #TODO init checking exeption
      #TODO alarm: if name field not exists in store
      # puts "** Singleton initialize - | #{PreferencesBoxer.store_type}"
      
      case PreferencesBoxer.store_type
        when 'Yaml'          
          @handler = PreferencesBoxer::YamlStore       
        when 'Store'
          begin
            # TODO alarm: if table not exists yet
            BoxerSetting.find_or_create_by_id 1
          rescue
          end
          @handler = PreferencesBoxer::StoreStore
        # else
          #todo exeption
      end
    end

   

    def method_missing(method, *args)
      name = method.to_s.gsub('=', '')
      if true #todo @config.has_key? name
        if method.to_s =~ /=$/
          set(name, args.first)
        else
          get(name)        
        end
      else
        super
      end
    end

    private
      def set(name, val)
        @handler.set name, val
      end

      def get(name)
        @handler.get name
      end
  end
end