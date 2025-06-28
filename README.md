# Configuration Backup

Where feasible, I try to keep my configurations archived in this GitHub repository so that I can keep my configurations consistent between computers.
I keep it public so I can show my configurations to other people, and so I don't have to bother with getting my GitHub account integration set up before anything else.
I cannot really recommend trying to get this configuration working on your computer, but I guess let me know if you try.

If you do try to get the whole thing working at once, I highly recommend making a backup of your current `.bashrc` and possibly other configuration files, and ensure you have a text editor other than (n)vim to fall back on if you need to make changes
Then, clone the repo and run `clone.sh` to copy everything to the proper locations.

To push configuration changes to this repo, clone it somewhere nonessential.
Then you can pull updates from the actual root directory into this git repo by running `pull.sh`.
You may need to change some file paths in `pull.sh` for it to work properly.

To do things piecemeal, read the relevant section below.

## Start here with new OS
```
sudo pacman -Syu    # Sync package databases and upgrade all packages
sudo pacman -S vim  # Install Vim
sudo pacman -S git  # Install Git
```

## Start here with a stale OS
- Maybe delete a bricked mirror in `sudo vim /etc/pacman.d/mirrorlist`
- Maybe delete `sudo rm -R /var/lib/pacman/sync/` if struggling with locks
- Run your `sudo pacman -Sy package` a few times
- Try rebooting

### Install Docker
[Main Install](https://wiki.archlinux.org/title/Docker)

### Install Neovim
Check if the version in pacman is the latest; if not, 
[install the newest Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package).

```
sudo pacman -S python3-neovim # Install Python 3 Neovim support
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
hostnamectl hostname ainspad # Change hostname if necessary
sudo pacman -S python3-pip   # Install pip for Python 3
```

I'm currently very into Catppuccin, so here's some of that

```
curl -LsSO "https://raw.githubusercontent.com/catppuccin/gtk/v1.0.3/install.py"
python3 install.py mocha lavender
```

[userstyles](https://github.com/catppuccin/userstyles/releases/tag/all-userstyles-export)

[kde plasma](https://github.com/catppuccin/kde)

## Start here if the OS is already configured

Don't forget to source the files or log out and log in again as needed for the changes to take effect.

### Neovim

`.config/nvim`: directory for my Neovim configuration

`.config/nvim/lua/plugins/`

* *catppuccin*: theming
* *glow*: markdown rendering
* *lualine*: pretty statusline
* *neo-tree*: file system management
* *nvim-cmp*: completion
* *nvim-treesitter*: lang
* *R.nvim*: RStudio conscientious objector
* *vim-markdown*: good markdown formatting

### Bash

* `.bash_aliases`
* `.bash_prompt`: color the prompt and hold workspace management logic
* `.bashrc`
* `.git-prompt.sh`

### Git
`.gitconfig`: configuration and profile for Git.
Change to reflect GitHub account information.

### Vim
`.vimrc`: old Vim configuration, obsolete unless I break Neovim
