# dotfiles

In the following instructions `<dotfiles>` means the path to this repository.

`bashrc-common` should be sourced in the bashrc (usually `~/.bashrc`):
```bash
. <dotfiles>/bashrc-common
```

`gitconfig-common` should be included in the global gitconfig (usually `~/.gitconfig`, may be `$XDG_CONFIG_HOME/git/config`):
```
[include]
    path = <dotfiles>/gitconfig-common
```

`vim/vimrc-common` should be sourced in the vimrc file (usually `~/.vimrc`, may be `$XDG_CONFIG_HOME/vim/vimrc` or other, see `:h .vimrc`):
```vim
source <dotfiles>/vim/vimrc-common
```

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

## Known Issues

### Vim Ctrl Shortcuts Stop Working

Vim Ctrl shortcuts may stop working after using a Ctrl shortcut the first time. This depends on the terminal.

Some terminals require adding the following lines to your vimrc:
```vim
let &t_TI = "\<Esc>[>4;1m"
let &t_TE = "\<Esc>[>4m"
```
Sometimes it should be `4;2` instead of `4;1` for `t_TI`.

See the relevant discussion: https://github.com/vim/vim/issues/9014#issuecomment-996750319.
