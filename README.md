# Configuration Backup

Where feasible, I try to keep my configurations archived in this GitHub repository
so that I can keep my configurations consistent between computers.
I keep it public so I can show my configurations to other people, and so I don't have to
bother with getting my GitHub account integration set up before anything else.
I cannot really recommend trying to get this configuration working on your computer,
but I guess let me know if you try.

If you do try to get the whole thing working at once, I highly recommend
making a backup of your current `.bashrc` and possibly other configuration
files, and ensure you have a text editor other than (n)vim to fall back on if
you need to make changes. Then, clone everything to the proper locations
quickly by running `clone.sh` locally. You don't need anything else from the
repo to do this.

To push configuration changes to this repo, clone it somewhere nonessential.
Then you can pull updates from the actual root directory into this git repo by running `pull.sh`.
You may need to change some file paths in `pull.sh` for it to work properly.

To do things piecemeal, read the relevant section below.

## Start here with new OS

```
sudo apt update && sudo apt upgrade -y              # Update package lists and upgrade installed packages
sudo apt install vim                                # Install Vim after updating package lists
sudo apt install git                                # Install Git
```

## Start here with a stale OS
- maybe delete a bricked mirror in `sudo vim /etc/pacman.d/mirrorlist`
- maybe delete `sudo rm -R /var/lib/pacman/sync/` if struggling with locks
- run your `sudo pacman -Sy package` a few times
- try rebooting

### Install Docker

[Main Install](https://docs.docker.com/engine/install/ubuntu/)

[Post Install](https://docs.docker.com/engine/install/linux-postinstall/)

[Docker-compose Install](https://docs.docker.com/compose/install/linux/)

### Install Neovim

[Install newest Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package)

```
sudo apt-get install python3-neovim                 # Install Python 3 Neovim support
```

[Install Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip)

```
unzip [font-name].zip
mkdir -p ~/.local/share/fonts
cp [path-to-font]/*.ttf ~/.local/share/fonts/
fc-cache -fv
```

Make sure to reboot the system if you're having trouble with the Nerd Font - I
found it doesn't like being added to a terminal emulator until after a reboot
regardless of if you update the `fc-cache`.


### Continue with installs

```
hostnamectl hostname lg-gram                        # Change hostname if necessary
sudo apt install python3-pip                        # Install pip for Python 3
sudo apt list --upgradable                          # List upgradable packages (optional informational step)
```

[Set up Bluetooth
keyboard](https://askubuntu.com/questions/701978/how-can-a-bluetooth-keyboard-that-requires-a-code-entry-be-paired-in-the-termina)
and if that isn't working, try [resetting the
keyboard](https://www.reddit.com/r/logitech/comments/17uqlqr/pebble_k380s_not_connecting_to_laptop_via/).

I'm currently very into Catppuccin, so here's some of that

```
curl -LsSO "https://raw.githubusercontent.com/catppuccin/gtk/v1.0.3/install.py"
python3 install.py mocha lavender
```

[userstyles](https://github.com/catppuccin/userstyles/releases/tag/all-userstyles-export)

[wallpaper](https://github.com/zhichaoh/catppuccin-wallpapers/blob/1023077979591cdeca76aae94e0359da1707a60e/landscapes/evening-sky.png)

## Start here if the OS is already configured

Don't forget to source the files or log out and log in again as needed for the changes to take effect.

### Neovim

`.config/nvim`: directory for my Neovim configuration

```
$ mkdir ~/.config
$ mkdir ~/.config/nvim
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/init.lua                 > ~/.config/nvim/init.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/.luarc.json              > ~/.config/nvim/.luarc.json
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lazy-lock.json              > ~/.config/nvim/lazy-lock.json
```

#### Neovim plugins
* *glow*: markdown rendering
* *lualine*: pretty statusline
* *neo-tree*: file system management
* *nightfox*: theme
* *vim-markdown*: good markdown formatting

```
$ mkdir ~/.config/nvim/lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins.lua          > ~/.config/nvim/lua/plugins.lua
$ mkdir ~/.config/nvim/lua/plugins
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/glow.lua  > ~/.config/nvim/lua/plugins/glow.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/lualine.lua  > ~/.config/nvim/lua/plugins/lualine.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/neo-tree.lua     > ~/.config/nvim/lua/plugins/neo-tree.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/nightfox.lua     > ~/.config/nvim/lua/plugins/nightfox.lua
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.config/nvim/lua/plugins/vim-markdown.lua > ~/.config/nvim/lua/plugins/vim-markdown.lua
```

### Bash

`.bash_aliases`: file to store the Bash aliases for reading in in `.bashrc`

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.bash_aliases        > ~/.bash_aliases
```

`.bashrc`: configuration for my Bash shell. You'll likely want to change the colors,
and you can find more [here](https://wiki.archlinux.org/index.php/Color_Bash_Prompt).

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

`.gitconfig`: configuration and profile for Git. Make sure to change to reflect your GitHub
account information.

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.gitconfig     > ~/.gitconfig
$ vim .gitconfig
```

### Vim

`.vimrc`: old Vim configuration, obsolete unless I break Neovim

```
$ curl https://raw.githubusercontent.com/ains-arch/dotfiles/main/.vimrc         > ~/.vimrc
```
