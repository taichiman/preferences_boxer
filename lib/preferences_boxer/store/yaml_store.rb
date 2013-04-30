module PreferencesBoxer
  class YamlStore < PreferencesBoxer::Store
    class << self
      def configure block
          block.call self
      end

      def path= path
        raise unless YAML.load_file path
        @@path = path
      end

      def path
        @@path
      end

      def set(name, val)
        config = YAML::load(File.read(@@path))
        config[name] = val
        File.open(@@path, 'w') {|f| f.write(YAML.dump(config))}
      end

      def get(name)
        YAML::load(File.read(@@path))[name]
      end
    end    
  end
end
