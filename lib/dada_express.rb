require "dada_express/version"

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
