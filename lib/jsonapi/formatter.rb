module JSONAPI
  class Formatter
    class << self
      def format(arg)
        arg.to_s
      end

      def unformat(arg)
        arg
      end

      def formatter_for(format)
        formatter_class_name = "JSONAPI::#{format.to_s.camelize}Formatter"
        formatter_class_name.safe_constantize
      end
    end
  end

  class UnderscoredFormatter < Formatter
  end

  class CamelizedFormatter < Formatter
    class << self
      def format(raw_value)
        super.camelize(:lower)
      end

      def unformat(formatted_value)
        formatted_value.to_s.underscore
      end
    end
  end

  class DasherizedFormatter < Formatter
    class << self
      def format(raw_value)
        super.dasherize
      end

      def unformat(formatted_value)
        formatted_value.to_s.underscore
      end
    end
  end

end
