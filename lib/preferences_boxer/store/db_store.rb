module PreferencesBoxer
  class DbStore < PreferencesBoxer::Store
    class << self
      def configure block
          block.call self
          @@source_record.class.class_eval { store @@source_field }
          @@source_record.reload # reload for update, after store method call
          val = eval("@@source_record.#{@@source_field}.unserialize")
          if defined?(@@init_values) and @@init_values != nil and ( (val == nil) or ( val == {} ))then
            eval("@@source_record.#{@@source_field}=@@init_values; @@source_record.save")
          end
      end

      def source_record=(rec)
        @@source_record = rec
      end

      def source_field=(field)
        @@source_field = field
      end

      def init_values=(val)
        @@init_values = val
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
