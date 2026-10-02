// Runtime smoke test for the Opal build of mml under Node.
//
// Usage, from a directory whose node_modules has @lutaml/opal-runtime and
// an @lutaml/lutaml-model built from a lutaml-model compatible with this
// gem's dependency:
//   bundle exec ruby spec/opal/build_smoke.rb /path/to/mml-opal.js
//   node /path/to/mml/spec/opal/smoke.js /path/to/mml-opal.js
// Loads those two packages, then the bundle built by
// spec/opal/build_smoke.rb, and round-trips one document per MathML
// version through the direct Mml::VN::Math.from_xml API, with no prior
// Mml.parse call. Exits non-zero on any failure.
const path = require("path");

const bundle = process.argv[2];
if (!bundle) {
  console.error("usage: node spec/opal/smoke.js <mml bundle>");
  process.exit(2);
}
const fromCwd = (spec) => require.resolve(spec, { paths: [process.cwd()] });

require(fromCwd("@lutaml/opal-runtime"));
require(fromCwd("@lutaml/lutaml-model"));
require(path.resolve(bundle)); // the bundle runs mml/opal as it loads

const Opal = globalThis.Opal;

const xml =
  '<math xmlns="http://www.w3.org/1998/Math/MathML"><mi>x</mi></math>';
let failed = false;
for (const version of ["V2", "V3", "V4"]) {
  const mathClass = Opal.Mml.$const_get(version).$const_get("Math");
  try {
    const math = mathClass.$from_xml(xml);
    const out = math.$to_xml();
    if (!out.includes("<mi>x</mi>")) throw new Error(`unexpected output: ${out}`);
    console.log(`ok ${version}: ${out.replace(/\s+/g, " ")}`);
  } catch (e) {
    failed = true;
    console.error(`FAIL ${version}: ${e.message || e}`);
  }
}
process.exit(failed ? 1 : 0);
