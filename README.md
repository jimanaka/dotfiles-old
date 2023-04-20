# Dotfiles
Portable configuration files for standing up new machines. Mainly for Arch Linux, but I may add instructions for other distros, idk.

* [Getting Started](#getting-started)

## Getting Started
### Installing Full Repo
The following instructions were adapted from [these instructions](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/) by Gabrielle Young. Refer to the link for more background information on this process.

1. Add .dotfiles to the global Git ingore so the repo does not track itself
```sh
$ echo ".dotfiles" >> $HOME/.gitignore
```

2. Clone the Git repo
```sh
$ git clone https://github.com/jimanaka/dotfiles.git $HOME/.dotfiles --bare
```

3. Create command alias
```sh
$ alias dotfiles='/usr/bin/git --git-dir=$home/.dotfiles --work-tree=$HOME
```

4. Ignore untracked files. This lets us manually choose what to include instead of tracking everything in the home directory
```sh
$ dotfiles config --local status.showUntrackedFiles no 
```

5. Checkout the git content. Pulls files from compressed database into the correct locations
```sh
$ dotfiles checkout 
```

6. Handling Errors
    * If you see errors similar to:
```sh
[-] error: The following untracked working tree files would be overwritten by checkout:
    .zshrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```
    * This occurs due to already-existing files on your computer overlapping with the dotfiles. Fix this by by backing up or deleting the overlapping files, then run 
```sh 
$ config checkout 
```


## Vim
