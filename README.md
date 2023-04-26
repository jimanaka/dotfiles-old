# Dotfiles
Portable configuration files for standing up new machines. Mainly for Arch Linux, but I may add instructions for other distros, idk.

* [Getting Started](#getting-started)
    * [Installing Full Repo](#installing-full-repo)

## Getting Started
### Installing Full Repo
The following instructions were adapted from [these instructions](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/) by Gabrielle Young. Refer to the link for more background information on this process.

1. Add .dotfiles to the global Git ingore so the repo does not track itself
```bash
$ echo ".dotfiles" >> $HOME/.gitignore
```

2. Clone the Git repo
```bash
$ git clone https://github.com/jimanaka/dotfiles.git $HOME/.dotfiles --bare
```

3. Create command alias
```bash
$ alias dotfiles='/usr/bin/git --git-dir=$home/.dotfiles --work-tree=$HOME
```

4. Ignore untracked files. This lets us manually choose what to include instead of tracking everything in the home directory
```bash
$ dotfiles config --local status.showUntrackedFiles no 
```

5. Checkout the git content. Pulls files from compressed database into the correct locations
```bash
$ dotfiles checkout 
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
$ config checkout 
```

### Setting Up New Bare Git Repos 
This isn't useful for setting up new machines with this Git repo, but I'll put this here for the purpose of creating new dotfile repos

1. Initialize a bare repo
```bash
$ git init --bare $HOME/.dotfiles
```

2. Create command alias
```bash
$ alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

3. Add alias to zsh config. You can also do this on bash, but with .bashrc
```bash
$ echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zsh/aliases
```

4. Source the alias in the zshrc file
```bash
$ echo "source $HOME/.zsh/aliases" >> $HOME/.zshrc
```


## Vim
