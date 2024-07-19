# Configuration Backup

Where feasible, I try to keep my configurations archived in this GitHub repository
so that I can keep my configurations consistent between computers.
It also lets me show my configurations to other people, in case I want to flex.

Clone everything to the proper locations quickly by running `clone.sh`.

## Contents

`.config/nvim`: directory for my Neovim configuration

```
$ mkdir ~/.config
$ mkdir ~/.config/nvim
$ mkdir ~/.config/nvim/lua
$ mkdir ~/.config/nvim/lua/plugins
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/lualine.lua  > ~/.config/nvim/lua/plugins/lualine.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/neo-tree.lua > ~/.config/nvim/lua/plugins/neo-tree.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins.lua          > ~/.config/nvim/lua/plugins.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/.luarc.json              > ~/.config/nvim/.luarc.json
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/init.lua                 > ~/.config/nvim/init.lua
```

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

`.gitconfig`: configuration and profile for Git

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.gitconfig     > ~/.gitconfig
$ vim .gitconfig
```

`.vimrc`: old Vim configuration, obsolete unless I break Neovim

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.vimrc         > ~/.vimrc
```

Don't forget to source the files or log out and log in again as needed for the changes to take effect.
