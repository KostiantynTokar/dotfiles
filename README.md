# dotfiles

Clone to your home directory
```bash
git clone --bare git@github.com:KostiantynTokar/dotfiles.git ~/dotfiles.git
```
Add alias to .bash_profile
```bash
alias git-dotfiles='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
```
Restart bash and hide untracked files from `git status`
```bash
git-dotfiles config --local status.showUntrackedFiles no
```

.gitconfig-common.inc should be included in global ~/.gitconfig
```
[include]
  path = ~/.gitconfig-common.inc
```
