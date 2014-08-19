require "net/http"
require "uri"
# require 'active_support/core_ext'
require "dmm/api/version"
require "dmm/api/response"
require "dmm/api/request"
require "xmlsimple"

module Dmm

  class Api

    @@options = {}

    class << self

      def options
        @@options
      end

      def configure(&proc)
        raise ArgumentError, "Block is required." unless block_given?
        yield @@options
      end

      def get(opts={})
        opts[:operation] = 'ItemList' unless opts.key?(:operation)
        opts[:version] = '2.00' unless opts.key?(:version)
        opts[:timestamp] = Time.now.strftime("%Y-%m-%d %H:%M:%S")  unless opts.key?(:timestamp)
        ids = @@options[:affiliate_id].split(",")
        opts[:affiliate_id] = ids[rand(ids.size)]
        Dmm::Request.get("http://affiliate-api.dmm.com/", @@options.merge(opts))
      end

    end

  end

end