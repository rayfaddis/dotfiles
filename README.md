# dotfiles

Shell, editor and tool config for Apple Silicon Macs, managed with
[rcm](https://github.com/thoughtbot/rcm). Paths assume Homebrew in `/opt/homebrew`.

## Requirements

[Homebrew](https://brew.sh/)

## Setup

1. Clone this repo into `$HOME/dotfiles`.

1. Install rcm:

   ```bash
   brew install rcm
   ```

1. Install the dotfiles for the first time:

   ```bash
   env RCRC=$HOME/dotfiles/rcrc rcup
   ```

   Setting `RCRC` points `rcup` at this repo's config for the first run. After
   that, `~/.rcrc` is linked and plain `rcup` works.

1. Start a fresh shell to load the new config:

   ```bash
   exec zsh
   ```

## What rcup does

`rcup` links every file in this repo into your home folder (`zshrc` becomes
`~/.zshrc`), and its hooks set up the rest:

- **Prepare** (`hooks/pre-up`): existing files that would be replaced, such as
  a machine's own `~/.zshrc`, move to `~/.dotfiles-backup/<timestamp>/` first.
  If a backup fails, rcup stops before linking anything.
- **Install**: Homebrew packages from `Brewfile` (installs missing ones and
  upgrades outdated ones) and zsh plugins from `zsh_plugins.txt` via antidote.
- **Configure** (`hooks/post-up`): checks every link and removes old links rcup
  no longer manages, then tmux plugins, custom app icons from `icons/`, and
  language versions from `tool-versions` via mise.
  Setting icons needs App Management permission for your terminal.

It ends with a summary of the machine's state. Output from each step goes to
`~/Library/Logs/dotfiles/rcup.log`. After a successful run, the `rcup` shell
function in `zshrc` restarts your shell so the changes apply. Other open windows
need `reload`.

### Options

| Command | Effect |
|---|---|
| `RCUP_VERBOSE=0 rcup` | List only what changed, not every package |
| `RCUP_RAW=1 rcup` | Stream raw command output (use if a step prompts for input) |
| `RCUP_RELOAD=0 rcup` | Don't restart the shell afterward |
| `NO_COLOR=1 rcup` | Plain text, no spinner |
| `rcup -K` | Skip the hooks; just link |

## Per-machine settings

These files are loaded if they exist and are never committed:

| File | Loaded by | Use for |
|---|---|---|
| `~/.zshrc.local` | `zshrc`, last | Machine-only PATH, env vars, completions |
| `~/.aliases.local` | `aliases`, last | Machine-only aliases |
| `~/.gitconfig.local` | `gitconfig`, last | e.g. a work `user.email` |
| `~/.psqlrc.local` | `psqlrc` | Local psql settings |

## Updating

Pull and re-run:

```bash
git -C ~/dotfiles pull
rcup
```

`rcup` is safe to run repeatedly. The banner warns when this machine is behind
origin.
