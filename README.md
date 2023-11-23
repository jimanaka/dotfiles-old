# Dotfiles
Portable configuration files for standing up new machines. Mainly for Arch Linux, but I may add instructions for other distros, idk.

## Index
* [Getting Started](#getting-started)
    * [Installing Full Repo](#installing-full-repo)
* [Zsh](#zsh)
* [Powerlevel10k](#powerlevel10k)
* [Install Fonts](#install-fonts)
* [Neovim](#neovim)

## Getting Started
### Installing Full Repo
The following instructions were adapted from [these instructions](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/) by Gabrielle Young. Refer to the link for more background information on this process.  

After installing the repo, continue to each tools setup from the [Index](#index)

1. Add .dotfiles to the global Git ingore so the repo does not track itself
```bash
echo ".dotfiles" >> $HOME/.gitignore
```

2. Clone the Git repo
```bash
git clone https://github.com/jimanaka/dotfiles.git $HOME/.dotfiles --bare
```

3. Create command alias
```bash
alias dotfiles='/usr/bin/git --git-dir=$home/.dotfiles --work-tree=$HOME
```

4. Ignore untracked files. This lets us manually choose what to include instead of tracking everything in the home directory
```bash
dotfiles config --local status.showUntrackedFiles no 
```

5. Checkout the git content. Pulls files from compressed database into the correct locations
```bash
dotfiles checkout 
```

6. Handling Errors
If you see errors similar to :
```bash
[-] error: The following untracked working tree files would be overwritten by checkout:
    .zshrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
It means you have already-existing files on your machine that conflicts with the repo. To resolve this, backup or delete the conflicting files and run:
```bash 
config checkout 
```

### Setting Up New Bare Git Repos 
This isn't useful for setting up new machines with this Git repo, but I'll put this here for the purpose of creating new dotfile repos

1. Initialize a bare repo
```bash
git init --bare $HOME/.dotfiles
```

2. Create command alias
```bash
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

3. Add alias to zsh config. You can also do this on bash, but with .bashrc
```bash
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
```

4. Source the alias in the zshrc file
```bash
echo "source $HOME/.zsh/aliases" >> $HOME/.zshrc
```

### Installing Individual Configuration Files
use [DownGit](https://minhaskamal.github.io/DownGit/#/home)

### Dependencies
* AwesomeWM Rice
```bash
yay -S --needed awesome-git polybar picom-pijulius-git alacritty betterlockscreen catppuccin-gtk-theme-mocha conky logo-ls lxappearance neovim neofetch papirus-icon-theme feh rofi xidlehook sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg
```
* TODO: List more dependencies




## Zsh
1. Install Zsh
```bash
sudo pacman -S zsh
```
oh-my-zsh should be automatically installed. If it isn't, continue 

2. Download oh-my-zsh
```bash
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
```

## Powerlevel10k
Powerlevel10k should also be installed automatically. If not, continue

1. CLone the repo
```bash
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

2. set the theme in ~.zshrc
```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

## Install Fonts
1. Download the following fonts
    * [MesloLGS NF Regular.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf)
    * [MesloLGS NF Bold.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf)
    * [MesloLGS NF Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf)
    * [MesloLGS NF Bold Italic.ttf](https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf)

2. Either click on the fonts, or install them to `/usr/share/fonts/MesloLGS/`
3. Set your terminal font to MesloLGS. This should automatically happen in alacritty.


## Neovim
### Install Neovim 0.9
1. Install through pacman package manager
```bash
sudo pacman -S neovim
```

2. Verify Neovim version
The Arch repos may install a newer version, as of now, this config is only tested with Neovim 0.9. Check your version with the following:
```bash
nvim --version
```

If you do not have Neovim 0.9, you must build and install the binary from source:
```bash
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9
make CMAKE_BUID_TYPE=Release
sudo make install
```

### Install Other Required Packages
There might be more than this, I'm just adding the documentation as I go
```bash
sudo pacman -S xsel zathura zathura-pdf-mupdf xdotool biber clangd ripgrep python texlive-most texlive-lang texlive-bibtexextra
```

### Python Support
1. Install python
```bash
sudo pacman -S python
```

2. Install pynvim
```bash
pip install pynvim
```

### Node Support
1. Install fnm (Fast Node Manager)
```bash
yay -S fnm
```

or
```bash
curl -fsSL https://fnm.vercel.app/install | bash
```

2. List node versions
```bash
fnm ls-remote
```

3. Install node version (tested with 19.3.0)
```bash
fnm install v19.3.0
```

### Running Neovim
Run neovim to install all the plugins and stuff
```bash
nvim
```

Check the health of neovim
```bash
:checkhealth
```

### Language Servers

