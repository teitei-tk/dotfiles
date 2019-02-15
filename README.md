# Dotfiles

## Setup

### Environments

```bash
$ git clone git://github.com:teitei-tk/MyDotfiles.git /path/to/MyDotfiles
$ cd /path/to/MyDotfiles
$ python setup.py
```

### VSCode

```bash
$ cd vscode/
$ sh restore.sh
```

## Keymap

### Ergodox Keymap

- https://github.com/teitei-tk/qmk_firmware/tree/master/keyboards/ergodox_ez/keymaps/teitei-tk

## Restore

```bash
$ brew bundle dump --force
$ cd vscode && sh restore.sh && cd -
```
