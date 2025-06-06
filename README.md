# dotfiles

Clone to your home directory and restore files.
```bash
git clone --bare git@github.com:KostiantynTokar/dotfiles.git ~/dotfiles.git
git --git-dir=$HOME/dotfiles.git --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/dotfiles.git --work-tree=$HOME restore --staged .
```

Until you source `.bashrc-common`, you can use git commands on this repo like this:
```bash
git --git-dir=$HOME/dotfiles.git --work-tree=$HOME <command>
```

`.bashrc-common` should be sourced at the end of `~/.bashrc`:
```bash
. ~/.bashrc-common
```

`.gitconfig-common` should be included in global `~/.gitconfig`:
```
[include]
    path = ~/.gitconfig-common.inc
```

`.vimrc-common` should be sourced at the end of `~/.vimrc`:
```vim
source ~/.vimrc-common
```

Restart the shell. From now on the alias `git-dotfiles` is available for managing this repo.

Optionally, install NodeJS on your system for coc.nvim plugin.
It is required for IDE-like features (go to definition, rename variable, etc.).

Before running vim, install all plugins by executing
```
vim +PlugInstall +qa
```
and pressing ENTER several times.

If NodeJS is installed, installation of clangd is required to enable coc-clangd extension.
clangd is a C++ language server that's required in C++ projects for IDE-like features.
Install clangd and add it to `PATH`, or execute command inside vim while cpp or header file is open
```
:CocCommand clangd.install
```

## Terminal Fonts

Vim may use some Unicode symbols that may be absent from the default font on some terminals.
You can install fonst that support those vim features from [NerdFonts](https://github.com/ryanoasis/nerd-fonts).
See installation methods in theirs `readme.md`. One of the methods is cloning the repo
```bash
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
```
and using the installation script
```bash
./install.sh <FontName>
```
or, in PowerShell (Windows)
```powershell
./install.ps1 <FontName>
```
I prefer `FiraMono` font because it is a monospaced font without ligatures.

After installation, open your terminal settings and select the installed font.
