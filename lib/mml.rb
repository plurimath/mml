# frozen_string_literal: true

module Mml
  class Error < StandardError; end
  DEFAULT_REGISTER_ID = :mml

  module_function

  def config
    Configuration.config
  end

  def parse(input, register: Configuration.default_register, namespace_exist: true)
    Configuration.adapter = DEFAULT_ADAPTER unless Configuration.adapter

    if namespace_exist
      Mml::MathWithNamespace.from_xml(input, register: register)
    else
      Mml::MathWithNilNamespace.from_xml(input, register: register)
    end
  end
end

require "lutaml/model"
require "mml/configuration"
DEFAULT_ADAPTER = if RUBY_ENGINE == "opal"
  require "lutaml/model/xml_adapter/oga_adapter"
  :oga
else
  require "lutaml/model/xml_adapter/ox_adapter"
  :ox
end
Moxml::Config.default_adapter = DEFAULT_ADAPTER
Mml::Configuration.default_register = Mml::DEFAULT_REGISTER_ID # creates a new register with id: :mml, only if it's not already created
if RUBY_ENGINE == "opal"
  require_relative "mml/opal_setup"
else
  Dir["lib/mml/*.rb"].each { |file| require "mml/#{File.basename(file, ".rb")}" }
end
