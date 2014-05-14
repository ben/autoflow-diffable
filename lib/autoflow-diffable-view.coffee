{View} = require 'atom'

module.exports =
class AutoflowDiffableView extends View
  @content: ->
    @div class: 'autoflow-diffable overlay from-top', =>
      @div "The AutoflowDiffable package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "autoflow-diffable:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "AutoflowDiffableView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
