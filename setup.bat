if not exist "%HOME%\.vim" mkdir %HOME%\.vim
mklink %HOME%\.vimrc %HOME%\dotfiles\vimrc
mklink %HOME%\.vim\cocvimrc %HOME%\dotfiles\cocvimrc

mklink %HOME%\.bashrc %HOME%\dotfiles\bashrc
