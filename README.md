# zeesh-man

Tiny and very simple zsh plugin manager.

zeesh-man does 3 things:

1. Download a plugin from GitHub
1. Source downloaded plugin
1. Update sourced plugins

## Installation

#### Step 1

Clone the repository:

```zsh
git clone https://github.com/zahidkizmaz/zeesh-man $HOME/.zeesh-man
```

#### Step 2

Source it in your .zshrc:

```zsh
source $HOME/.zeesh-man/zeesh.zsh
```

## Installing plugins

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

Debug mode can be enabled by `export ZEESH_DEBUG=1`.

Dry run mode can be enabled by `export ZEESH_DRY_RUN=1`.

## WARNING

zeesh-man is at experimental state. Please use it at your own risk!
Bug reports/fixes are highly appreciated.
