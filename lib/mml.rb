# frozen_string_literal: true

require "zeitwerk"
require "lutaml/model"

DEFAULT_ADAPTER = if RUBY_ENGINE == "opal"
                    require "lutaml/model/xml_adapter/oga_adapter"
                    :oga
                  else
                    require "lutaml/model/xml_adapter/ox_adapter"
                    :ox
                  end

loader = Zeitwerk::Loader.for_gem(warn_on_extra_files: false)
loader.setup

module Mml
  class Error < StandardError; end

  module_function

  def config
    Configuration.config
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

begin
  loader.eager_load(force: true)
rescue Zeitwerk::NameError => e
  flunk e.message
end
