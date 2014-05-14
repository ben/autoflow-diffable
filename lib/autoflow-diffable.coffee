module.exports =
  activate: (state) ->
    atom.workspaceView.eachEditorView (editorView) =>
      if editorView.attached and editorView.getPane()?
        editorView.command 'autoflow-diffable:reflow-selection', =>
          @reflowSelection(editorView.editor)

  reflowSelection: (editor) ->
    range = editor.getSelectedBufferRange()
    range = editor.getCurrentParagraphBufferRange() if range.isEmpty()

    if range?
      editor.getBuffer().change(range, @reflow(editor.getTextInRange(range)))

  reflow: (text) ->
    paragraphBlocks = text.split /\n\s*\n/g

    newBlocks = for block in paragraphBlocks
      sentences = block.match(/[^.!\?]+[.!\?]*/g) || []
      newSentences = for s in sentences
        s.replace('\n', ' ').replace(/[ ]+/, ' ').trim()
      newSentences.join '\n'

    newBlocks.join '\n\n'
