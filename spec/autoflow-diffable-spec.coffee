AutoflowDiffable = require '../lib/autoflow-diffable'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

# Helper
shouldMatch = (input, expected) ->
  expected ||= input
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
      shouldMatch "== A chapter"

    it "doesn't reflow single blocks that shouldn't be reflowed", ->
      shouldMatch """
== A Chapter Title. Deal With It. ==

.An Asciidoc thingy
image::images/foobar.png[The alt-text for this image.]

--[source,shell]
----
Shell blocks. They shouldn't be rewrapped.
----

  indented code blocks. they shouldn't be rewrapped either. foobar.
"""

    it "handles multi-block parts of a document", ->
      shouldMatch """
```
This shouldn't wrap. At all.

Not this either. Not one bit.
```
      """

    it "handles punctuation", ->
      shouldMatch """
This is a sentence. "This is also a sentence." 'So is this.'
      """, """
This is a sentence.
"This is also a sentence."
'So is this.'
      """

    it "doesn't rewrite urls", ->
      shouldMatch "kernel.org is a website."

    it "rewraps and indents lists", ->
      shouldMatch """
* Abc. Def.
* Jkl. Mno.

- Adam. Bravo.
- Charlie. Dog.
      """, """
* Abc.
  Def.
* Jkl.
  Mno.

- Adam.
  Bravo.
- Charlie.
  Dog.
      """

    it "leaves trailing parentheses and quotes", ->
      shouldMatch """
"A sentence." And not a sentence.

(A parenthetical.) And not a parenthetical.

("Both in one.") Hopefully.
      """, """
"A sentence."
And not a sentence.

(A parenthetical.)
And not a parenthetical.

("Both in one.")
Hopefully.
      """
