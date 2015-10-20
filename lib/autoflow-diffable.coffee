module.exports =
  activate: (state) ->
    atom.commands.add 'atom-text-editor',
      'autoflow-diffable:reflow-selection': (event) =>
        @reflowSelection(event.currentTarget.getModel())

  reflowSelection: (editor) ->
    range = editor.getSelectedBufferRange()
    range = editor.getCurrentParagraphBufferRange() if range.isEmpty()

    if range?
      editor.getBuffer().setTextInRange(range, @reflow(editor.getTextInRange(range)))

  reflow: (text) ->
    paragraphBlocks = text.split /\n\s*\n/g
    keepSkipping = false

    newBlocks = for block in paragraphBlocks
      extendedBlockStart = /^(```|--)/
      extendedBlockEnd = /[\s\S](```|--)$/
      leaveMeAlone = /^(  |\t|\.|\[\[|[=]|image::)/

      # Skip multi-block verbatim sections
      if extendedBlockStart.test block
        keepSkipping = true

      theBlock = block
      unless keepSkipping or leaveMeAlone.test(block)
        prefix = if /^[-\d*]/.test(block) then '  ' else ''
        theBlock = block.replace(/([\.!\?]["')]*)( +|$)/g, "$1\n#{prefix}").trim()

      if keepSkipping and extendedBlockEnd.test block.trim() # TODO: trim end only
        keepSkipping = false

      theBlock

    newBlocks.join '\n\n'
