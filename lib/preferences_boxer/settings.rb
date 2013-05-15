require 'singleton'

module PreferencesBoxer

  class << self 
    def store_type= v
      @store_type = v
    end

    def store_type
      @store_type
    end

    def configure &block
      # Модулю сохранения передать каждому полученные ключи, и получить дескриптор 
      # класса. Инициализацию из синглтона удалить.
      begin
        yield self
      rescue
      end
      #TODO проверить, что передали тип модуля сохранения, иначе exeption
      require "preferences_boxer/store/#{store_type}_store"

      const_get("#{store_type.capitalize}Store").configure block

      # PreferencesBoxer::Settings.instance      
      PreferencesBoxer::Settings.new    
    end
  end

  class Settings 
    # include Singleton

    def initialize
      #TODO Если начальная установка, то наверное заполняем сеттинги стандартными значениями
      #TODO init checking exeption
      #TODO alarm: if name field not exists in store
      # puts "** Singleton initialize - | #{PreferencesBoxer.store_type}"
      
      case PreferencesBoxer.store_type
        when 'yaml'          
          @handler = PreferencesBoxer::YamlStore       
        when 'db'
          @handler = PreferencesBoxer::DbStore
        # else
          #todo exeption
      end
    end

    def handler
      @handler
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