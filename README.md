# zeesh-man - Tiny, Simple ZSH Plugin Manager

**zeesh-man** can do 3 things:

1. Download a plugin from GitHub
1. Source a downloaded plugin
1. Update all sourced plugins

## Installation

### Bootstrapping (Recommended)

If you want to automatically install and set up zeesh-man:

```zsh
# Clone zeesh-man
if [[ ! -f $HOME/.zeesh-man/zeesh.zsh ]]; then
  command git clone https://github.com/zahidkizmaz/zeesh-man.git $HOME/.zeesh-man
fi
source $HOME/.zeesh-man/zeesh.zsh

# Install plugins
zeesh_get "zsh-users/zsh-syntax-highlighting"
zeesh_get "zsh-users/zsh-autosuggestions"
zeesh_get "jeffreytse/zsh-vi-mode"
```

### Manual

#### Step 1

Clone the repository:

```zsh
git clone https://github.com/zahidkizmaz/zeesh-man.git $HOME/.zeesh-man
```

#### Step 2

Source zeesh-man in your .zshrc:

```zsh
source $HOME/.zeesh-man/zeesh.zsh
```

## Installing plugins

In .zshrc file:

```zsh
source $HOME/.zeesh-man/zeesh.zsh

# After sourcing the zeesh-man
zeesh_get "zsh-users/zsh-autosuggestions"
zeesh_get "jeffreytse/zsh-vi-mode"
```

## Updating plugins

```zsh
zeesh-update
```

## Configuring zeesh-man

- Debug mode can be enabled by `export ZEESH_DEBUG=1`.
- Dry run mode can be enabled by `export ZEESH_DRY_RUN=1`.

## WARNING!

zeesh-man is at experimental state. Please use it at your own risk!
Bug reports/fixes are highly appreciated.

### Story of this plugin

So far I have been manually managing my plugins. This fairly easy for me because I had only 2 plugins.
Recently, I wanted to add one more plugin and I felt like it is time for a plugin manager.
However, what I wanted is very simple without any overhead. Just download the plugin and source it.
Additionally, update the plugins with a custom command.

These needs created the **zeesh-man**
