# dotfiles

## TODO

- [x] Install NVIM Markdown previewer
- [x] Move NVIM config to lua script from vimscript
- [x] Move NVIM from vimplug to packer
- [x] Move entirely from dotfile-local to just dotfiles
- [ ] Look into using Nest for keymaps
- [ ] Clean up NVIM configs
- [ ] Test Brewfile
- [ ] Execute Brewfile on rcup
- [ ] Update Brewfile for Mac Apps
- [ ] Cleanup README
- [ ] Remove all VIM config and install

## Requirements

Set zsh as your login shell:

    chsh -s $(which zsh)

## Setup

Install [rcm](https://github.com/thoughtbot/rcm):

```bash
    brew tap thoughtbot/formulae
    brew install rcm
```

Install the dotfiles for the first time:

```bash
    env RCRC=$HOME/dotfiles/rcrc rcup
```

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options during the first time setup.

Please configure the `rcrc` file if you'd like to make personal overrides in a
different directory.

## Updating Dotfiles

From time to time you should pull down any updates to your dotfiles by running

```bash
    rcup
```

You can safely run `rcup` multiple times!
