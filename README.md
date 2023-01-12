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
Restart the shell. From now on `git-dotfiles` alias is available for managing of this repo.

.gitconfig-common.inc should be included in global ~/.gitconfig
```
[include]
  path = ~/.gitconfig-common.inc
```

Before running vim, install all plugins by executing
```
vim +PlugInstall +qa
```
and pressing ENTER several times.
