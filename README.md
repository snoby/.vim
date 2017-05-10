
To add new projects aka submodules do it like this:
```
git submodule add git://github.com/tpope/vim-fugitive.git bundle/vim-fugitive
git commit -m 'Added vim-fugitive'
git push
```
do pull down and initalize everything on a new computer:

```
git clone git@github.com:snoby/.vim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
```
and when I want to update all the submodules just use the git command:
```
git submodule update
```
