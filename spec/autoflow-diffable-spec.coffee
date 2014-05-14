AutoflowDiffable = require '../lib/autoflow-diffable'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AutoflowDiffable", ->
  describe "reflowing paragraphs", ->
    it "reflows sentences", ->
      lipsum = "Abc def. Ghi? Jkl mno pqr!"
      expected = """
Abc def.
Ghi?
Jkl mno pqr!
      """.trim()
      expect(AutoflowDiffable.reflow lipsum).toEqual(expected)
