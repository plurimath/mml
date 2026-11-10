# frozen_string_literal: true

require "json"
framework = ENV.fetch("LUTAML_MODEL_SOURCE")
$LOAD_PATH.unshift(File.join(File.expand_path(framework), "lib"))
$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "mml"
require "lutaml/model/lml"

Lutaml::Model::Config.xml_adapter_type = :nokogiri
namespace = "http://www.w3.org/1998/Math/MathML"
inputs = {
  "mi-mixed" => ["Mi", %(<mi xmlns="#{namespace}">x<malignmark/>y<mglyph src="g.png" alt="g"/>z</mi>)],
  "mi-prefixed" => ["Mi", %(<m:mi xmlns:m="#{namespace}" mathvariant="bold">alpha</m:mi>)],
  "math-nested" => ["Math", %(<math xmlns="#{namespace}" display="block"><mrow><mi>a</mi><mo>+</mo><mfrac><mi>x<malignmark/>y</mi><mrow><mn>1</mn><mo>+</mo><mn>2</mn></mrow></mfrac><mi>b</mi></mrow><mi>c</mi></math>)],
}
executed = []
[3, 4].each do |version|
  mod = Mml.const_get("V#{version}")
  config = mod::Configuration
  config.populate_context! unless config.context
  register = config.context_id
  bundle = Lutaml::Model::Lml::Importer.bundle(Mml::Portable.bundle(version: version))
  classes = Lutaml::Model::Lml.import_bundle(bundle)
  inputs.each do |name, (class_name, input)|
    source = mod.const_get(class_name).from_xml(input, register: register).to_xml(register: register)
    klass = classes.fetch("Mml::V#{version}::#{class_name}@#{register}")
    actual = klass.from_xml(input, register: register).to_xml(register: register)
    abort "v#{version}-#{name}: imported writer differs from source" unless source == actual
    repeated = klass.from_xml(actual, register: register).to_xml(register: register)
    abort "v#{version}-#{name}: writer roundtrip is unstable" unless repeated == actual

    executed << "v#{version}-#{name}"
    puts "PASS #{executed.last}"
  end
end
abort "expected exactly 6 model/writer cases" unless executed.size == 6
puts JSON.generate(expected: 6, executed: executed.size, failed: 0, case_ids: executed)
