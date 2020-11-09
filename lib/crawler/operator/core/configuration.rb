require 'active_support/core_ext/module/attribute_accessors'

module Crawler
  module Movie
    module Providers
      module Tmdb
        mattr_accessor :default_provider

        def self.configure
          yield self
        end
      end
    end
  end
end
