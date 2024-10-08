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

### Install Neovim

[Install newest Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package)

```
sudo apt-get install python3-neovim                 # Install Python 3 Neovim support
```

[Install Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip)

```
unzip [font-name].zip
mkdir -p ~/.local/share/fonts
cp [path-to-font]/*.otf ~/.local/share/fonts/
fc-cache -fv
```

Make sure to reboot the system if you're having trouble with the Nerd Font - I
found it doesn't like being added to a terminal emulator until after a reboot
regardless of if you update the `fc-cache`.

## Start here if the OS is already configured

```
$ ./clone.sh
```
