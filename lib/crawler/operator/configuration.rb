require 'crawler/configuration'

module Crawler
  module Operator
    include Crawler::Configuration

    class Configuration
      attr_accessor :default_provider
    end
  end
end
