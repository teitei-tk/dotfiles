# Dotfiles

## Setup

### Dotfiles

```bash
$ git clone git://github.com:teitei-tk/MyDotfiles.git /path/to/MyDotfiles
$ cd /path/to/MyDotfiles
$ python setup.py
```

### HomeBrew

```bash
$ brew bundle
```

### VSCode

```bash
$ cd vscode/
$ sh restore.sh
```

## Keymap

### Ergodox Keymap

- https://github.com/teitei-tk/qmk_firmware/tree/master/keyboards/ergodox_ez/keymaps/teitei-tk

## Fonts

### Source Han Code JP

- https://github.com/adobe-fonts/source-han-code-jp

## install poewrline fonts

- https://github.com/powerline/fonts#quick-installation

## Restore

```bash
$ brew bundle dump --force
$ cd vscode && sh restore.sh && cd -
```
