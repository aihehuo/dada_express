require "dada_express/version"
require "rest-client"

module DadaExpress
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end
end

require_relative 'dada_express/configuration'
require_relative 'dada_express/request'
require_relative 'dada_express/sign'
require_relative 'dada_express/params_service'
