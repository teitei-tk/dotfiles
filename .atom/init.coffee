# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
util = require 'util'

########################################
# autocomplete-python
########################################
# autocomplete-python setting is apply setting of each project
# TODO:
#   * check anyenv is installed.
#   * apply .python-version of each project.
#   * apply pyenv version for .python-version of each project.
#     * if .python-version does not exist, apply of global version.
#       * global-version exist at $HOME/.anyenv/envs/pyenv/version
atom.config.set('autocomplete-python.pythonPaths', util.format('%s/.anyenv/envs/pyenv/shims/python', process.env.HOME))
atom.config.set('autocomplete-python.extraPaths', util.format('%s/.anyenv/envs/pyenv/versions', process.env.HOME))
