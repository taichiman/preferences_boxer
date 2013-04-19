module PreferencesBoxer
  class YamlStore
    def self.path= path
      raise unless YAML.load_file path
      @@path=path
    end

    def self.path
      @@path
    end

    def self.set(name, val)
      config=YAML::load(File.read(@@path))
      config[name]=val
      File.open(@@path, 'w') {|f| f.write(YAML.dump(config))}
    end

    def self.get(name)
      YAML::load(File.read(@@path))[name]
    end
  end
end
