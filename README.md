# dotfiles

## Requirements

[Homebrew](https://brew.sh/)

## Setup

1. Clone this repo into $HOME/dotfiles

2. Install [rcm](https://github.com/thoughtbot/rcm):

```bash
  brew tap thoughtbot/formulae
  brew install rcm
```

3. Install the dotfiles for the first time:

```bash
  env RCRC=$HOME/dotfiles/rcrc rcup
```

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options during the first time setup and is not needed after the
first run.

Please configure the `rcrc` file if you'd like to make personal overrides in a
different directory.

4. Source your bash

```
  src
```

## Updating Dotfiles

From time to time you should pull down any updates to your dotfiles by running

```bash
  rcup
```

You can safely run `rcup` multiple times!
