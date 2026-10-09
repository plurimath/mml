# frozen_string_literal: true

require "spec_helper"
require "open3"
require "rbconfig"

module DirectModelUseSpec
  module_function

  # Returns stdout, stderr and status from +script+ in a fresh Ruby process.
  def run_fresh(script)
    lib_dir = File.expand_path("../../lib", __dir__)
    Open3.capture3(RbConfig.ruby, "-rbundler/setup", "-I", lib_dir,
                   "-e", script)
  end
end

RSpec.describe "Mml direct model use" do # rubocop:disable RSpec/DescribeClass
  describe "direct model use in a fresh process" do
    %w[V2 V3 V4].each do |version|
      it "round-trips Mml::#{version}::Math.from_xml/to_xml without a prior parse" do
        script = <<~RUBY
          require "mml"
          require "lutaml/model"
          Lutaml::Model::Config.xml_adapter_type = :nokogiri
          input = '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>x</mi></math>'
          context_id = Mml::#{version}::Configuration.context_id
          math = Mml::#{version}::Math.from_xml(input, register: context_id)
          print math.to_xml
        RUBY

        out, err, status = DirectModelUseSpec.run_fresh(script)

        expect(status).to be_success, "subprocess failed:\n#{err}"
        expect(out).to include("<mi>x</mi>")
      end
    end
  end
end
