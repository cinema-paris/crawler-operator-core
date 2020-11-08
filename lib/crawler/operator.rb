require 'active_support/core_ext/hash/keys'
require 'active_support/inflector'
require 'crawler/base'

module Crawler
  module Operator
    include Base

    PROVIDERS = []

    def self.add_provider(provider_name, options = {})
      options.assert_valid_keys :insert_at

      PROVIDERS.insert(options[:insert_at] || -1, provider_name)
    end

    def self.resolve(name, address)
      full_address = "#{address.dig(:street)}, #{address.dig(:zipcode)} #{address.dig(:city)}, #{address.dig(:country).upcase}"

      PROVIDERS.find do |provider_name|
        camelized = ActiveSupport::Inflector.camelize("crawler/operator/providers/#{provider_name.to_s}")
        klass = ActiveSupport::Inflector.constantize(camelized)

        klass.resolve(name, full_address)
      end
    end
  end
end
