require 'singleton'
require 'preferences_boxer/yaml_store'
require 'preferences_boxer/store_store'

module PreferencesBoxer

  def self.store_type= v
      @store_type=v
  end

  def self.store_type
      @store_type
  end

  class Settings 
    include Singleton

    def initialize
      #TODO Если начальная установка, то наверное заполняем сеттинги стандартными значениями
      #TODO init checking exeption
      
      # puts "** Singleton initialize - | #{PreferencesBoxer.store_type}"
      
      case PreferencesBoxer.store_type
        when 'Yaml'          
          @handler=PreferencesBoxer::YamlStore       
        when :Store
        #   SiteSetting.find_or_create_by_id 1, settings: {site_name: 'test1', owner_name: 'test2', admin_login: 'root', admin_password: '$2a$10$sd66SJyZxCVjavZ2Cz3s1OsuoFawJ4Pyu/GPc98mj8k0ahSp.feQW'}
        #   @handler=PreferencesBoxer::StoreStore       
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
        # @handler.set name, val
      end

      def get(name)
        # @handler.get name
      end
  end
end