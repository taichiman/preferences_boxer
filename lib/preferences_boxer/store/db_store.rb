module PreferencesBoxer
  class DbStore < PreferencesBoxer::Store
    def self.set(name, val)
      o = BoxerSetting.first
      o.settings[name.to_sym] = val
      o.save
    end

    def self.get(name)
      BoxerSetting.first.settings[name.to_sym]
    end
  end
end
