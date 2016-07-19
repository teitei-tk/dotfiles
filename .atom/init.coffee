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
fs = require 'fs'

class FileUtil
  @isFile = (path) ->
    return fs.existsSync(path) and fs.statSync(path).isFile()

  @isDir = (path) ->
    return fs.existsSync(path) and fs.statSync(path).isDirectory()

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
pyEnvRoot = process.env.PYENV_ROOT
if pyEnvRoot and FileUtil.isDir pyEnvRoot
  localVersionPath = util.format '%s/.python-version', atom.project.getPaths()[0]
  globalVersionPath = util.format '%s/version', pyEnvRoot

  applyVirtualEnv = (filePath) ->
    require('child_process').exec(util.format('cat %s', filePath), (err, stdout, stderr) ->
      version = stdout.trim()
      if not version
        return

      atom.config.set 'autocomplete-python.pythonPaths', util.format('%s/shims/python', pyEnvRoot)
      atom.config.set 'autocomplete-python.extraPaths', util.format('%s/versions/%s/lib/python2.7/site-packages', pyEnvRoot, version)
    )

  if FileUtil.isFile localVersionPath
    applyVirtualEnv localVersionPath
  else if FileUtil.isFile globalVersionPath
    applyVirtualEnv globalVersionPath
