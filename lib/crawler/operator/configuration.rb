require 'active_support/core_ext/module/attribute_accessors'

module Crawler
  module Operator
    mattr_accessor :default_provider
  end
end
