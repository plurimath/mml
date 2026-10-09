# frozen_string_literal: true

# Compiles lib/mml/opal.rb with Opal into the file named by ARGV[0], for
# spec/opal/smoke.js. lutaml-model, moxml and oga are stubbed: at runtime
# they come from the @lutaml/lutaml-model npm package, loaded first, as in
# plurimath/mml-js. ox and nokogiri are MRI-only XML adapters.

require "opal"
require "opal/builder"

STUBS = %w[
  lutaml/model
  lutaml/model/xml
  lutaml/model/json
  lutaml/model/yaml
  lutaml/model/key_value
  lutaml/model/toml
  lutaml/model/type
  lutaml/model/serialize
  ox
  nokogiri
  oga
  moxml
  moxml/compat/opal/moxml_boot
].freeze

out = ARGV.fetch(0)
builder = Opal::Builder.new
builder.append_paths(File.expand_path("../../lib", __dir__))
builder.stubs = STUBS.dup
builder.prerequired = %w[opal]
File.write(out, builder.build("mml/opal").to_s)
warn "wrote #{out}"
