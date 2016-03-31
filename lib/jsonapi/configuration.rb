require 'jsonapi/formatter'

module JSONAPI
  class Configuration
    attr_reader :json_key_format,
                :link_format,
                :key_formatter,
                :link_formatter

    def initialize
      # :underscored, :camelized, :dasherized, or custom
      self.json_key_format = :dasherized

      # :underscored, :camelized, :dasherized, or custom
      self.link_format = :dasherized
    end

    def json_key_format=(format)
      @json_key_format = format
      @key_formatter = JSONAPI::Formatter.formatter_for(format)
    end

    def link_format=(format)
      @link_format = format
      @link_formatter = JSONAPI::Formatter.formatter_for(format)
    end

  end

  class << self
    attr_accessor :configuration
  end

  @configuration ||= Configuration.new

  def self.configure
    yield(@configuration)
  end
end

