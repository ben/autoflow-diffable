AutoflowDiffable = require '../lib/autoflow-diffable'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AutoflowDiffable", ->
  describe "reflowing paragraphs", ->
    it "reflows sentences", ->
      lipsum = "Abc def. Ghi? Jkl mno pqr! stu"
      expected = """
Abc def.
Ghi?
Jkl mno pqr!
stu
      """.trim()
      expect(AutoflowDiffable.reflow lipsum).toEqual(expected)

    it "works when text isn't really punctuated", ->
      expect(AutoflowDiffable.reflow "== A chapter").toEqual "== A chapter"
