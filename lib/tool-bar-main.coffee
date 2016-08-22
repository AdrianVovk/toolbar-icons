module.exports =
  activate: (state) ->
    require('atom-package-deps').install('tool-bar-main')

  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  consumeToolBar: (toolBar) ->
    @toolBar = toolBar 'toolbar-default'

    @toolBar.addButton
      icon: 'plus'
      callback: 'tree-view:add-file' # TODO do not use this make cusom version and use eventually.
      tooltip: 'New File'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'content-save'
      callback: 'project-plus:save'
      tooltip: 'Save Project'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'folder'
      callback: 'project-plus:toggle-project-finder'
      tooltip: 'Open...'
      iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'play'
      callback: ->
          atom.notifications.addWarning('Run feature coming soon!', null)
      tooltip: 'Run'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'bug'
      callback: ->
          atom.notifications.addWarning('Debug feature coming soon!', null)
      tooltip: 'Debug'
      iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'settings'
      callback: 'settings-view:open'
      tooltip: 'Open Settings View'
      iconset: 'mdi'

    if atom.inDevMode()
      

      @toolBar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'mdi'

      @toolBar.addButton
        icon: 'code-tags'
        callback: ->
          require('remote').getCurrentWindow().toggleDevTools()
        tooltip: 'Toggle Developer Tools'
        iconset: 'mdi'
