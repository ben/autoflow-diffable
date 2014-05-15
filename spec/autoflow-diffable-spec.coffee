AutoflowDiffable = require '../lib/autoflow-diffable'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

# Helper
shouldMatch = (input, expected) ->
  expect(AutoflowDiffable.reflow input.trim()).toEqual expected.trim()

describe "AutoflowDiffable", ->
  describe "reflowing paragraphs", ->
    it "reflows sentences", ->
      shouldMatch "Abc def. Ghi? Jkl mno pqr! stu",
        """
Abc def.
Ghi?
Jkl mno pqr!
stu
        """

    it "works when text isn't really punctuated", ->
      shouldMatch "== A chapter", "== A chapter"

    it "doesn't reflow single blocks that shouldn't be reflowed", ->
      unwrappableText = """
== A Chapter ==

.An Asciidoc thingy
image::images/foobar.png[The alt-text for this image.]

--[source,shell]
$ echo "Shell blocks. They shouldn't be rewrapped."

  indented code blocks. they shouldn't be rewrapped either. foobar.
"""
      shouldMatch unwrappableText, unwrappableText

    it "handles punctuation", ->
      shouldMatch """
This is a sentence. "This is also a sentence." 'So is this.'
      """, """
This is a sentence.
"This is also a sentence."
'So is this.'
      """
