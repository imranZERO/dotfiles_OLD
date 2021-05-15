git clone --depth=1 https://github.com/mhinz/vim-startify && \
git clone --depth=1 https://github.com/preservim/nerdtree && \
git clone --depth=1 https://github.com/justinmk/vim-sneak.git && \
git clone --depth=1 https://github.com/jiangmiao/auto-pairs.git && \
git clone --depth=1 https://github.com/jpalardy/vim-slime.git && \
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git && \
git clone --depth=1 https://github.com/junegunn/rainbow_parentheses.vim.git && \
git clone --depth=1 https://github.com/preservim/nerdcommenter.git && \
git clone --depth=1 https://github.com/itchyny/lightline.vim.git && \
git clone --depth=1 https://github.com/tpope/vim-surround && \
git clone --depth=1 https://github.com/junegunn/goyo.vim.git && \
git clone --depth=1 https://github.com/nathanaelkane/vim-indent-guides.git && \
git clone --depth=1 https://github.com/junegunn/fzf.git && \
git clone --depth=1 https://github.com/junegunn/fzf.vim.git

# colors
curl -o colors/gruvbox.vim --create-dirs https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim
curl -o colors/nord.vim https://raw.githubusercontent.com/arcticicestudio/nord-vim/develop/colors/nord.vim 

curl -o lightline.vim/autoload/lightline/colorscheme/gruvbox.vim https://raw.githubusercontent.com/shinchu/lightline-gruvbox.vim/master/plugin/lightline-gruvbox.vim
