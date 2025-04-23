# dotfiles

Clone to your home directory
```bash
git clone --bare git@github.com:KostiantynTokar/dotfiles.git ~/dotfiles.git
git --git-dir=$HOME/dotfiles.git --work-tree=$HOME config --local status.showUntrackedFiles no
git --git-dir=$HOME/dotfiles.git --work-tree=$HOME restore --staged .
```
Resolve your config files. See the diff between configs from the repo and your local configs via
```bash
git --git-dir=$HOME/dotfiles.git --work-tree=$HOME diff
```

`.bashrc-common` should be sourced at the end of `~/.bashrc`:
```bash
. ~/.bashrc-common
```

.gitconfig-common.inc should be included in global ~/.gitconfig
```
[include]
  path = ~/.gitconfig-common.inc
```

Restart the shell. From now on `git-dotfiles` alias is available for managing of this repo.

Optionally, install NodeJS on your system for coc.nvim plugin.

Before running vim, install all plugins by executing
```
vim +PlugInstall +qa
```
and pressing ENTER several times.

If NodeJS is installed, installation of clangd is required to enable coc-clangd extension.
Install clangd and add it to `$PATH`, or execute command inside vim while cpp or header file is open
```
:CocCommand clangd.install
```
