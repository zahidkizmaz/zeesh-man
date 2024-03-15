# zeesh-man - Tiny, Simple ZSH Plugin Manager

### Story behind zeesh-man:

Before, I have been manually managing Zsh plugins in my .zshrc file.
Sourcing them and updating them occasionally was fairly easy for me because I had only 2 plugins.
The burden was not much: making sure my plugins are sourced in my zshrc file correctly and updated regularly.

Recently, I wanted to add more plugins to my Zsh setup and I felt like it is time for a plugin manager.
However, what I wanted was a very simple plugin manager with minimal overhead.
Just downloading the plugin and sourcing it. As well as, allowing me to update it with a single command.

These needs created the **zeesh-man**

Therefore, **zeesh-man** is able to do 3 things:

1. Download a plugin from GitHub
1. Source a downloaded plugin
1. Update all sourced plugins

## Installation

### Bootstrapping (Recommended)

If you want to automatically install and set up zeesh-man:

Copy this in to your .zshrc file:

```zsh
# Install zeesh-man if not already installed.
zeesh_dir=${XDG_DATA_HOME:-"$HOME/.local/share"}/zeesh/zeesh-man
if [[ ! -f $zeesh_dir/zeesh.zsh ]]; then
  command git clone https://github.com/zahidkizmaz/zeesh-man.git "$zeesh_dir"
fi
source "$zeesh_dir/zeesh.zsh"

# Example plugin definitions:
zeesh_get "zsh-users/zsh-syntax-highlighting"
zeesh_get "zsh-users/zsh-autosuggestions"
```

### Manual

#### Step 1

Clone the repository:

```zsh
git clone https://github.com/zahidkizmaz/zeesh-man.git ${XDG_DATA_HOME:-"$HOME/.local/share"}/zeesh/zeesh-man
```

#### Step 2

Source zeesh-man in your .zshrc:

```zsh
source ${XDG_DATA_HOME:-"$HOME/.local/share"}/zeesh/zeesh-man/zeesh.zsh
```

## Installing plugins

In .zshrc file:

```zsh
source $HOME/.zeesh-man/zeesh.zsh

# After sourcing the zeesh-man
zeesh_get "zsh-users/zsh-syntax-highlighting"
zeesh_get "zsh-users/zsh-autosuggestions"
```

## Updating plugins

In your terminal run this command to update your plugins and zeesh-man:

```zsh
zeesh-update
```

## Configuring zeesh-man

- Debug mode can be enabled by `export ZEESH_DEBUG=1`.
- Dry run mode can be enabled by `export ZEESH_DRY_RUN=1`.

## WARNING!

zeesh-man is at experimental state. Please use it at your own risk!
Bug reports/fixes are highly appreciated.
