# frozen_string_literal: true

require "lutaml/model"
require "mml/configuration"
if RUBY_ENGINE == "opal"
  require_relative "mml/opal_setup"
else
  lib_path = File.join(__dir__, "mml", "*.rb")
  Dir[lib_path].each do |file|
    basename = File.basename(file, ".rb")
    next if basename == "common_attributes"

    require_relative "mml/#{basename}"
  end
end
# Ensure that the CommonAttributes class is loaded after all
# other classes
require "mml/common_attributes"

DEFAULT_ADAPTER = if RUBY_ENGINE == "opal"
                    require "lutaml/model/xml_adapter/oga_adapter"
                    :oga
                  else
                    require "lutaml/model/xml_adapter/ox_adapter"
                    :ox
                  end

Moxml::Config.default_adapter = DEFAULT_ADAPTER

module Mml
  class Error < StandardError; end

  module_function

  def config
    Configuration.config
  end

  def update_attributes
    Configuration::COMMON_ATTRIBUTES_CLASSES.each do |klass|
      const_get(klass).import_model(CommonAttributes)
    end
  end

  def parse(input, namespace_exist: true)
    Configuration.adapter = DEFAULT_ADAPTER unless Configuration.adapter

    if namespace_exist
      Mml::MathWithNamespace.from_xml(input)
    else
      Mml::MathWithNilNamespace.from_xml(input)
    end
  end
end

Mml.update_attributes
