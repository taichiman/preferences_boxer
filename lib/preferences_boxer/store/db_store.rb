module PreferencesBoxer
  class DbStore < PreferencesBoxer::Store
    class << self
      def configure block
          block.call self
          Здесь застрял, пока: Person.class_eval { store @source_field } 
      end

      def source_record=(rec)
        @source_record = rec
      end

      def source_field=(field)
        @source_field = field
      end

      def set(name, val)
        rec = @source_record
        eval "rec.#{@source_field}.unserialize[name.to_sym] = val"
        rec.save
      end

      def get(name)
        eval "@source_record.#{@source_field}.unserialize[name.to_sym]"
      end
    end
  end
end
