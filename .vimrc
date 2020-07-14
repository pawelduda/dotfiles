set shell=/bin/bash

set title

"Removed in Neovim, keeping this for backwards compatibility
set ttimeoutlen=100
set ttyfast
" set lazyredraw
set nocompatible
set noshowmode

:set listchars=eol:¬
:set list

"Scroll horizontally by 1 character instead of default half screen
set sidescroll=5
"Always show at least 1 line above/below the cursor while scrolling
" set scrolloff=1

"Move vertically by rows rather than lines (useful with long lines + wrap on)
nnoremap j gj
nnoremap k gk

"Automatically indent pasted text
nmap =p p`[v`]==
nmap =P P`[v`]==

set shortmess-=S
set shortmess-=s
"Mouse support
set mouse=a

set timeoutlen=1000 ttimeoutlen=0

"Show absolute line number directly to the left of current cursor's position and relative numbers elsewhere (awesome!)
set number
" set relativenumber
set norelativenumber
set nocursorline

set linebreak
set nowrap
set showbreak=▶
set textwidth=120
set noshowmatch

"No beep or flash
autocmd VimEnter * set vb t_vb=
set hidden
set sessionoptions=resize,winpos,winsize,buffers,tabpages,
set laststatus=2
set showtabline=0

"Disable swap files creation
set noswapfile

"Create new splits to the right/below of currently active instead of left/top (seems more natural)
set splitright
set splitbelow

"Encoding:
" set langmenu=en_US.UTF-8
" set encoding=utf-8
" set fileencoding=utf-8

"Search:
"Highlight search matches
set hlsearch
set ignorecase
"Override the 'ignorecase' option if the search pattern contains upper case characters.
set smartcase
"Search as you type
set incsearch

"Indentantion:
"Copy indent from current line when starting a new line
set autoindent
"In insert mode, add spaces instead of tabs
set expandtab
"Default tab width
set shiftwidth=2
"Smart autoindenting when starting a new line
set smartindent
set smarttab
set softtabstop=2

"Ruler:
set ruler
set colorcolumn=120

"Undo history length
set undolevels=200
set undofile
"Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Live preview of Ex commands
set inccommand=nosplit

"Plugins:
call plug#begin('~/.vim/plugged')
"General:
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'NLKNguyen/papercolor-theme'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'mhartington/oceanic-next'
Plug 'sheerun/vim-polyglot'
Plug 'mbbill/undotree'
" Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'pechorin/any-jump.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"Git integration:
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

"Bottom bar:
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'shinchu/lightline-gruvbox.vim'

"Syntax:
" Plug 'w0rp/ale'
" Plug 'scrooloose/syntastic'

"Fuzzy search:
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'JazzCore/ctrlp-cmatcher'

"Autocomplete, snippets
" Plug 'ervandew/supertab'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/neoinclude.vim'
Plug 'awetzel/elixir.nvim'
" Plug 'carlitux/deoplete-ternjs'
" Plug 'fishbullet/deoplete-ruby'
Plug 'Shougo/context_filetype.vim'
Plug 'Shougo/echodoc.vim'
" Plug 'Shougo/neoinclude.vim'

"Comments:
Plug 'tpope/vim-commentary'

Plug 'ntpeters/vim-better-whitespace'

Plug 'terryma/vim-expand-region'
Plug 'szw/vim-maximizer'
"Automatic text alignment
Plug 'godlygeek/tabular'

"Ruby
" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-rvm'
" Plug 'ngmy/vim-rubocop'

" Plug 'mattboehm/vim-unstack'
" Plug 'mattboehm/vim-accordion'

"Rails
" Plug 'tpope/vim-rails'
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rake'

"Yaml
Plug 'lmeijvogel/vim-yaml-helper'

"Haml
" Plug 'tpope/vim-haml'

"Slim
" Plug 'slim-template/vim-slim'

"JS
" Plug 'pangloss/vim-javascript'
" Plug 'isRuslan/vim-es6'
" Plug 'kchmck/vim-coffee-script'
" Plug 'mxw/vim-jsx'
" Plug 'othree/yajs.vim'
" Plug 'moll/vim-node'

"TypeScript
" Plug 'Shougo/vimproc.vim' "Async execution library, required by tsuquyomi
Plug 'leafgarland/typescript-vim'
" Plug 'Quramy/tsuquyomi'

"HTML
Plug 'mattn/emmet-vim'

"Neovim only
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'
Plug 'benekastah/neomake'

"Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

"Rust
" Plug 'rust-lang/rust.vim'

"Elixir
" Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
Plug 'vimwiki/vimwiki'

 Plug 'ElmCast/elm-vim'

" Plug 'MattesGroeger/vim-bookmarks'
" Plug 'yuttie/comfortable-motion.vim'
"
" Plug 'zxqfl/tabnine-vim'
Plug 'prettier/vim-prettier'

" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'

Plug 'https://github.com/Alok/notational-fzf-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'woelke/vim-nerdtree_plugin_open'
Plug 'cohama/lexima.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug '907th/vim-auto-save'
Plug 'ryanoasis/vim-devicons'
" Plug 'francoiscabrol/ranger.vim'
Plug 'morhetz/gruvbox'
Plug 'psliwka/vim-smoothie'
Plug 'ap/vim-you-keep-using-that-word'
Plug 'rhysd/git-messenger.vim'
Plug 'rhysd/clever-f.vim'
Plug 'jpalardy/vim-slime'
" Plug 'DanilaMihailov/beacon.nvim'
"

" Plug 'camspiers/animate.vim'
" Plug 'camspiers/lens.vim'

call plug#end()

" let g:elixir_docpreview = 1
" let g:elixir_showerror = 1
" let g:elixir_autobuild = 1
let g:syntastic_enable_elixir_checker = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
set background=light
" set background=dark
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
" colorscheme OceanicNext
" highlight NonText ctermbg=none
" highlight Normal guibg=none
" highlight NonText guibg=none
" highlight SignColumn ctermbg=none
" highlight SignColumn guibg=none
" highlight LineNr ctermbg=none
" highlight LineNr guibg=none
" highlight EndOfBuffer ctermbg=none
" highlight EndOfBuffer guibg=none
" highlight VertSplit ctermbg=none
" highlight VertSplit guibg=none
" colorscheme PaperColor
colorscheme gruvbox

set omnifunc=syntaxcomplete#Complete

autocmd Filetype sass setlocal ts=2 sts=2 sw=2
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4

"TypeScript integration config
let g:neomake_javascript_enabled_makers = ['eslint']
let g:tsuquyomi_disable_quickfix = 1
" let g:neomake_typescript_enabled_makers = []
" let g:syntastic_typescript_tsc_fname = ''
" let g:syntastic_typescript_checkers = ['tsuquyomi']
autocmd FileType typescript setlocal completeopt+=menu,preview

"Map leader to comma
let mapleader = ","

"Use commands like this: ;w instead of :w
" nnoremap : q:i
" nnoremap ; q:i

"Easymotion
map <Leader> <Plug>(easymotion-prefix)
" nmap <Leader>l :NERDTreeFind<cr>:Bookmark<cr>
nmap <Leader>n :NERDTreeFind<cr>:Bookmark<cr>
" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
" omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
 " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

"Auto remove trailing whitespaces on save
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=1

"Easytags
"Async easytags
let g:easytags_async = 1
"Create tags files per working directory
" let g:easytags_dynamic_files = 2
" set cpoptions+=d

" CtrlP
" Use this function to prevent CtrlP opening files inside non-writeable buffers, e.g. NERDTree
" function! SwitchToWriteableBufferAndExec(command)
"     let c = 0
"     let wincount = winnr('$')
"     " Don't open it here if current buffer is not writable (e.g. NERDTree)
"     while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
"         exec 'wincmd w'
"         let c = c + 1
"     endwhile
"     exec a:command
" endfunction

" nnoremap <C-p> :call SwitchToWriteableBufferAndExec('FzfPreviewDirectoryFiles')<CR>
" nnoremap <C-l> :call SwitchToWriteableBufferAndExec('FzfPreviewMruFiles')<CR>



" augroup fzf_preview
"   autocmd!
"   autocmd User fzf_preview#initialized call s:fzf_preview_settings()
" augroup END

" function! s:fugitive_add(paths) abort
"   for path in a:paths
"     execute 'silent G add ' . path
"   endfor
"   echomsg 'Git add ' . join(a:paths, ', ')
" endfunction

" function! s:fugitive_reset(paths) abort
"   for path in a:paths
"     execute 'silent G reset ' . path
"   endfor
"   echomsg 'Git reset ' . join(a:paths, ', ')
" endfunction

" function! s:fugitive_patch(paths) abort
"   for path in a:paths
"     execute 'silent tabedit ' . path . ' | silent Gdiff'
"   endfor
"   echomsg 'Git add --patch ' . join(a:paths, ', ')
" endfunction

" function! s:buffers_delete_from_lines(lines) abort
"   for line in a:lines
"     let matches = matchlist(line, '^buffer \(\d\+\)$')
"     if len(matches) >= 1
"       execute 'bdelete! ' . matches[1]
"     else
"       execute 'bdelete! ' . line
"     endif
"   endfor
" endfunction

" function! s:fzf_preview_settings() abort
"   let g:fzf_preview_fugitive_processors = fzf_preview#resource_processor#get_processors()
"   let g:fzf_preview_fugitive_processors['ctrl-a'] = function('s:fugitive_add')
"   let g:fzf_preview_fugitive_processors['ctrl-r'] = function('s:fugitive_reset')
"   let g:fzf_preview_fugitive_processors['ctrl-c'] = function('s:fugitive_patch')

"   let g:fzf_preview_buffer_delete_processors = fzf_preview#resource_processor#get_default_processors()
"   let g:fzf_preview_buffer_delete_processors['ctrl-x'] = function('s:buffers_delete_from_lines')
" endfunction

" nnoremap <C-g> :FzfPreviewGitStatus -processors=g:fzf_preview_fugitive_processors<CR>
nnoremap <C-p> :FzfPreviewDirectoryFiles<CR>
" nnoremap <C-l> :FzfPreviewMruFiles -add-fzf-arg=--no-sort<CR>
nnoremap <C-l> :FzfPreviewMruFiles -add-fzf-arg=--no-sort<CR>
" nnoremap <C-j> :FzfPreviewBuffers -processors=g:fzf_preview_buffer_delete_processors<CR>
" nnoremap <C-k> :FzfPreviewBuffers -processors=g:fzf_preview_buffer_delete_processors<CR>
" nnoremap <C-u> :FzfPreviewBuffers -processors=g:fzf_preview_buffer_delete_processors<CR>

" Disable default mapping since we are overriding it with our command
" let g:ctrlp_map = ''
" nnoremap <C-p> :call SwitchToWriteableBufferAndExec('CtrlP')<CR>
" nnoremap <C-l> :call SwitchToWriteableBufferAndExec('CtrlPMRUFiles')<CR>

" Use ag over grep
" if executable('ag')
"     set grepprg=ag\ --nogroup\ --nocolor
"     " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"     " ag is fast enough that CtrlP doesn't need to cache
"     let g:ctrlp_use_caching = 0
" endif

" " Use Ctrlp C matcher over ag for even more speed
" let g:ctrlp_match_func = { 'match' : 'matcher#cmatch' }


" Show only MRU files in current working dir
let g:ctrlp_mruf_relative = 1
let g:ctrlp_mruf_max = 20
" air-line
" let g:airline_powerline_fonts = 1

"airline fixes
" let g:airline_theme='oceanicnext'
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif
" let g:airline_symbols.space = "\ua0"
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }
" let g:lightline#bufferline#enable_devicons = 1
" let g:lightline#bufferline#clickable = 1
" let g:lightline.component_raw = {'buffers': 1}

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

let g:any_jump_grouping_enabled = 1
let g:any_jump_list_numbers = 1
let g:any_jump_remove_comments_from_results = 0
let g:any_jump_results_ui_style = 'filename_last'
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Default: <leader>al
nnoremap <leader>l :AnyJumpLastResults<CR>

nnoremap \ :Rg<SPACE>
" Default: <leader>j
nnoremap <leader>m :AnyJump<CR>

xnoremap \ y:Rg<SPACE><C-r>"<CR>
" Default: <leader>j
xnoremap <leader>m :AnyJumpVisual<CR>

nnoremap <C-_> :FzfPreviewLines -add-fzf-arg=--no-sort -add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap <C-Bslash> :FzfPreviewLines -add-fzf-arg=--no-sort<Enter>
" nnoremap <C-Bslash> :FzfPreviewBufferLines<Enter>

"NERDTree shortcut ,2
" nnoremap <leader>2 <C-n> :NERDTreeToggle<CR>
"Autostart NERDTree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
" Uncomment line below in case of performance issues
" autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
" autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip


" Gitgutter
set signcolumn=auto

let g:gitgutter_preview_win_floating = 1
let g:gitgutter_grep = 'rg'

nnoremap <leader>gg :GitGutterPreviewHunk<CR>

"Uncomment two lines below in case of performance issues
" let g:gitgutter_realtime = 0
" let g:gitgutter_eager = 0
" let g:gitgutter_grep_command = 'ag %s -l --nocolor -g ""'

"I believe these settings (especially re=1) solved slow performance in mvim
set nocursorcolumn
set cursorline
syntax sync minlines=256
set synmaxcol=4000
set re=1

let test#strategy = 'neoterm'

"Exit terminal mode with esc
:tnoremap <Esc> <C-\><C-n>"

"Neomake on save
autocmd! BufWritePost * Neomake

"Unified clipboard
if has('nvim')
  set clipboard+=unnamedplus
endif

" Paste from the register with the last yank instead (deleting doesn't override that register)
" noremap p "0p
" noremap P "0P
" Preserve pasting behaviour for other registers
" for s:i in ['"','*','+','-','.',':','%','/','=','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']
    " execute 'noremap "'.s:i.'p "'.s:i.'p'
    " execute 'noremap "'.s:i.'P "'.s:i.'P'
" endfor

"JS
let g:jsx_ext_required = 0

" check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" makeYCM compatible with UltiSnips (using supertab)
" let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
" let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger = "<C-e>"
" let g:UltiSnipsJumpForwardTrigger = "<tab>"
" let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

"Python
let g:syntastic_python_checkers = []
"
" Tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Center screen on next/previous selection.
nmap n /<CR>zz
nmap N ?<CR>zz
" Last and next jump should center too.
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

set ttyfast

" Workaround for random text artifacts appearing after resizing tmux window
au VimResized * :redraw!

" Unmap default mappings when entering nerd tree and map when entering other buffer
" function! BookmarkMapKeys()
  " nmap mm :BookmarkToggle<CR>
  " nmap mi :BookmarkAnnotate<CR>
  " nmap mn :BookmarkNext<CR>
  " nmap mp :BookmarkPrev<CR>
  " nmap ma :BookmarkShowAll<CR>
  " nmap mc :BookmarkClear<CR>
  " nmap mx :BookmarkClearAll<CR>
  " nmap mkk :BookmarkMoveUp
  " nmap mjj :BookmarkMoveDown
" endfunction
" function! BookmarkUnmapKeys()
  " unmap mm
  " unmap mi
  " unmap mn
  " unmap mp
  " unmap ma
  " unmap mc
  " unmap mx
  " unmap mkk
  " unmap mjj
" endfunction
" autocmd BufEnter * :call BookmarkMapKeys()
" autocmd BufEnter NERD_tree_* :call BookmarkUnmapKeys()

let b:ale_linters = {'ruby': []}

" Prevent first * from immediately jumping to the next occurrence
nnoremap * *``

" The escape key is a long ways away. This maps it to the sequence 'kj'
noremap! kj <esc>
nnoremap <esc> :noh<Enter>

let g:nv_search_paths = ['~/wiki', '~/writing', '~/code', 'docs.md' , './notes.md']

" Vim-go settings
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeDirArrowExpandable = ''
let NERDTreeDirArrowCollapsible = ''
" Below is useful for autorefreshing syntax, etc. after renaming a file via NERDTree
" But it completely slows down vim after few dozen buffer switches. Not worth it, gotta find another way.
" autocmd BufEnter * :filetype detect

let g:fzf_preview_command = 'batcat --theme=base16 --color=always --style=grid {-1}'
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'
let g:fzf_preview_lines_command = "awk '{if (NF>0) print NR, $0}'"
let g:fzf_preview_floating_window_rate = 0.9
let g:fzf_preview_use_dev_icons = 0

let g:webdevicons_enable_nerdtree = 0

noremap :W :w
xmap S( S)

let g:nerdtree_plugin_open_cmd = 'xdg-open'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" autocmd VimLeave * :CocCommand session.save `:pwd`
" autocmd VimEnter * :CocCommand session.load dudev

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

"Improve windows navigation by using 'alt + x' combination even when terminal window is active
" :tnoremap <A-h> <C-\><C-n><C-w>h
" :tnoremap <A-j> <C-\><C-n><C-w>j
" :tnoremap <A-k> <C-\><C-n><C-w>k
" :tnoremap <A-l> <C-\><C-n><C-w>l
" :nnoremap <A-h> <C-w>h
" :nnoremap <A-j> <C-w>j
" :nnoremap <A-k> <C-w>k
" :nnoremap <A-l> <C-w>l

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

set updatetime=1000 " Affects cursorhold
let g:auto_save_events = ["CursorHold"]
let g:auto_save = 1
" let g:auto_save_no_updatetime = 1

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir
let g:undotree_WindowLayout = 2
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_HighlightChangedText = 0
let g:undotree_DiffAutoOpen = 0
let g:undotree_HelpLine = 0

let g:git_messenger_include_diff = 'current'

" Allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

let g:slime_target = 'tmux'
let g:slime_dont_ask_default = 1
" let g:slime_default_config = {"socket_name": "default", "target_pane": "3"}
let g:slime_default_config = {"socket_name": "default", "target_pane": "5"}

function! SendRspecToTmux() abort
  execute 'silent SlimeSend1 be spring rspec ' . expand('%:p') . ':' . line('.')
  " execute 'silent SlimeSend1 be rspec ' . expand('%:p') . ':' . line('.')
endfunction

nmap <Leader>r :call SendRspecToTmux()<CR>

" Performance issues, disable this
let g:polyglot_disabled = ['typescript.tsx', 'markdown']

" Annoying folding, I don't need a wannabe WYSIWYG in Vim -.-
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

autocmd VimResized * exe "normal \<c-w>="
