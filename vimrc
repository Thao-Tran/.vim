set nocompatible              " be iMproved, required
filetype on                  " required
filetype plugin on
filetype indent on

set t_Co=256
syntax on

colorscheme onedark
" transparent background
hi normal guibg=NONE

noremap <S-l> gt
noremap <S-h> gT

imap kj <Esc>
map <Space> :

set spell spelllang=en_ca
set number
set autoread
set list listchars=trail:$,multispace:\ >
set colorcolumn=81
set expandtab
set tabstop=8 sts=2 sw=2

match ErrorMsg '\s\+$'

autocmd Filetype python setlocal sts=4 sw=4
autocmd Filetype rust setlocal sts=4 sw=4 tw=100

autocmd Filetype java set sts=4 sw=4 tw=100 makeprg=javac\ %

set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if (!has("nvim"))
  set viminfo+=n~/.vim/viminfo

	" ALE config
	let g:ale_completion_enabled = 0
	let g:ale_completion_autoimport = 0
	let g:ale_fixers = {
	\   '*': ['remove_trailing_lines', 'trim_whitespace'],
	\   'javascript': ['eslint'],
	\   'rust': ['rustfmt'],
	\}
	" Only run linters named in ale_linters settings.
	let g:ale_linters_explicit = 1
	let g:ale_linters = {
	\  'rust': ['analyzer'],
	\  'javascript': ['eslint']
	\}

	" Set this variable to 1 to fix files when you save them.
	let g:ale_fix_on_save = 1

	set omnifunc=ale#completion#OmniFunc

	" Airline config
	" Enable powerline fonts
	let g:airline_powerline_fonts = 1
	let g:airline_extensions = ['ale', 'branch']

	packadd! nerdtree
	packadd! ale
	packadd! nerdtree-git-plugin
	packadd! vim-ember-hbs
	packadd! vim-fugitive
	packadd! vim-markdown
elseif (has("nvim"))
	" Airline config
	" Enable powerline fonts
	let g:airline_powerline_fonts = 1
	let g:airline_extensions = ['branch']
endif

packadd! vim-airline

silent! helptags ALL

set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backups//
