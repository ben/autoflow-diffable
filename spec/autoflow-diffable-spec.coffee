AutoflowDiffable = require '../lib/autoflow-diffable'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "AutoflowDiffable", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('autoflowDiffable')

  describe "when the autoflow-diffable:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.autoflow-diffable')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'autoflow-diffable:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.autoflow-diffable')).toExist()
        atom.workspaceView.trigger 'autoflow-diffable:toggle'
        expect(atom.workspaceView.find('.autoflow-diffable')).not.toExist()
