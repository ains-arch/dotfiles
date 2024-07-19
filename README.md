# Configuration Backup

Where feasible, I try to keep my configurations archived in this GitHub repository
so that I can keep my configurations consistent between computers.
It also lets me show my configurations to other people, in case I want to flex.

Clone everything to the proper locations quickly by running `clone.sh`.
WARNNG: you'll probably need to fiddle with things to get them working correctly,
which is a lot easier to do if you have a text editor other than vim to fall back to.
You should also make sure to back up your current `.bashrc` and other configuration files,
in case you need to copy something back in from them (like, for example, the conda initialization
block).

To make changes to this repo, clone it somewhere nonessential.
Then you can pull updates from the actual root directory into this git repo by running `pull.sh`.
You'll proably need to change some file paths in `pull.sh` for it to work properly.

## Contents

Don't forget to source the files or log out and log in again as needed for the changes to take effect.

### Neovim

`.config/nvim`: directory for my Neovim configuration

```
$ mkdir ~/.config
$ mkdir ~/.config/nvim
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/init.lua                 > ~/.config/nvim/init.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/.luarc.json              > ~/.config/nvim/.luarc.json
```

#### Neovim plugins
* *lualine*: pretty statusline
* *neo-tree*: file system management
* *vim-markdown*: good markdown formatting

```
$ mkdir ~/.config/nvim/lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins.lua          > ~/.config/nvim/lua/plugins.lua
$ mkdir ~/.config/nvim/lua/plugins
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/lualine.lua  > ~/.config/nvim/lua/plugins/lualine.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/neo-tree.lua > ~/.config/nvim/lua/plugins/neo-tree.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/vim-markdown.lua > ~/.config/nvim/lua/plugins/vim-markdown.lua
```

### Bash

`.bashrc`: configuration for my Bash shell

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.bashrc        > ~/.bashrc
```

`.dircolors`: ls coloring in `.bashrc`

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.dircolors     > ~/.dircolors
```

`.git-prompt.sh`: prompt coloring in `.bashrc`

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.git-prompt.sh > ~/.git-prompt.sh
```

### Git

`.gitconfig`: configuration and profile for Git

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.gitconfig     > ~/.gitconfig
$ vim .gitconfig
```

### Old Vim configuration

`.vimrc`: old Vim configuration, obsolete unless I break Neovim

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.vimrc         > ~/.vimrc
```
