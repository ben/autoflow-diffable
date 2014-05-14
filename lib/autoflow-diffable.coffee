AutoflowDiffableView = require './autoflow-diffable-view'

module.exports =
  autoflowDiffableView: null

  activate: (state) ->
    @autoflowDiffableView = new AutoflowDiffableView(state.autoflowDiffableViewState)

  deactivate: ->
    @autoflowDiffableView.destroy()

  serialize: ->
    autoflowDiffableViewState: @autoflowDiffableView.serialize()
