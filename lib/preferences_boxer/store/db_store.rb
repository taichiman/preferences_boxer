module PreferencesBoxer
  class DbStore < PreferencesBoxer::Store
    class << self
      def configure block
          block.call self
          @@source_record.class.class_eval { store @@source_field }
          # User.class_eval { store :settings } #включает сериализацию
          @@source_record.reload # reload for update, after store method call
      end

      def source_record=(rec)
        @@source_record = rec
      end

      def source_field=(field)
        @@source_field = field
      end

      def set(name, val)
        rec = @@source_record
        eval "rec.#{@@source_field}.unserialize[name.to_sym] = val"
        rec.save
      end

      def get(name)
        begin # rescue, if value == nil
          eval "@@source_record.#{@@source_field}.unserialize[name.to_sym]"
        rescue
        end
      end
    end
  end
end
