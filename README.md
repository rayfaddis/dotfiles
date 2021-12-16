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

## Install

Clone onto your laptop:

    git clone git://github.com/thoughtbot/dotfiles.git ~/dotfiles

(Or, [fork and keep your fork
updated](http://robots.thoughtbot.com/keeping-a-github-fork-updated)).

Install [rcm](https://github.com/thoughtbot/rcm):

    brew tap thoughtbot/formulae
    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcrc rcup

After the initial installation, you can run `rcup` without the one-time variable
`RCRC` being set (`rcup` will symlink the repo's `rcrc` to `~/.rcrc` for future
runs of `rcup`). [See
example](https://github.com/thoughtbot/dotfiles/blob/master/rcrc).

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

* Please configure the `rcrc` file if you'd like to make personal
  overrides in a different directory

## Update

From time to time you should pull down any updates to these dotfiles, and run

    rcup

to link any new files and install new vim plugins. **Note** You _must_ run
`rcup` after pulling to ensure that all files in plugins are properly installed,
but you can safely run `rcup` multiple times so update early and update often!

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course)
configuration:

* Improve color resolution.
* Remove administrative debris (session name, hostname, time) in status bar.
* Set prefix to `Ctrl+s`
* Soften status bar color from harsh green to light gray.
