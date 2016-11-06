module.exports =
  config:
    pushWithCommit:
      type: 'boolean'
      default: true
      title: 'Commit and Push'
      description: 'The "Commit" button in the toolbar also pushes the project to the remote repository'

  activate: (state) ->


  deactivate: ->
    @toolBar?.removeItems()

  serialize: ->

  consumeToolBar: (getToolBar) ->
    @toolBar = getToolBar 'toolbar-icons'

    @toolBar.addButton
      icon: 'plus'
      callback: 'tree-view:add-file' # TODO do not use this make cusom version and use eventually.
      tooltip: 'New File'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'content-save'
      callback: 'core:save'
      tooltip: 'Save'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'folder'
      callback: 'project:toggle-project-finder'
      tooltip: 'Open...'
      iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'play'
      callback: 'build:run'
      tooltip: 'Run'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'bug'
      callback: 'build:debug'
      tooltip: 'Debug'
      iconset: 'mdi'

    @toolBar.addButton
      icon: 'publish'
      callback: 'build:release'
      tooltip: 'Release'
      iconset: 'mdi'

    if atom.project.getRepositories()[0]?
      #Time for some Git controls
      @toolBar.addSpacer()

      @toolBar.addButton
        icon: 'git'
        callback: 'git:menu'
        tooltip: 'Git Menu'
        iconset: 'mdi'

      @toolBar.addButton
        icon: 'upload'
        callback: if atom.config.get("toolbar-icons.pushWithCommit") then 'git:add-all-commit-and-push' else 'git:add-all-and-commit'
        tooltip: 'Commit'
        iconset: 'mdi'

      @toolBar.addButton
        icon: 'download'
        callback: 'git:pull'
        tooltip: 'Pull'
        iconset: 'mdi'

    @toolBar.addSpacer()

    @toolBar.addButton
      icon: 'settings'
      callback: 'settings-view:open'
      tooltip: 'Settings'
      iconset: 'mdi'

    if atom.inDevMode()

      @toolBar.addButton
        icon: 'refresh'
        callback: 'window:reload'
        tooltip: 'Reload Window'
        iconset: 'mdi'

      @toolBar.addButton
        icon: 'code-tags'
        callback: 'window:toggle-dev-tools'
        tooltip: 'Developer Tools'
        iconset: 'mdi'
