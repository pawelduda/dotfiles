set shell=/bin/zsh

set title

" Removed in Neovim, keeping this for backwards compatibility
set mouse=a
set nolazyredraw
set nocompatible
set noswapfile

set listchars=eol:¬,tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list
set shada='1000

" Scroll horizontally by 1 character instead of default half screen

" Move vertically by rows rather than lines (useful with long lines + wrap on)
nnoremap j gj
nnoremap k gk

" Automatically indent pasted text
nnoremap p p=`]
"nmap =p p`[v`]==
"nmap =P P`[v`]==
"
set sidescroll=5
set scrolloff=1

set shortmess-=S
set shortmess-=s
" Mouse support

set timeoutlen=1000 ttimeoutlen=0

set number
set norelativenumber
set nocursorline

set noshowmode
set laststatus=2
set showtabline=0

set linebreak
set nowrap
set showbreak=▶
set textwidth=120
set noshowmatch

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" No beep or flash
autocmd VimEnter * set vb t_vb=

set hidden
set sessionoptions=resize,winpos,winsize,buffers,tabpages,

set splitright
set splitbelow

" Encoding:
set langmenu=en_US.UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Search:
set hlsearch
set ignorecase
set smartcase
set incsearch

set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=2

" Ruler:
set ruler
set colorcolumn=120

" Undo history length
set undolevels=500

" Live preview of Ex commands
set inccommand=nosplit

call plug#begin('~/.vim/plugged')
Plug 'xolox/vim-misc'
Plug 'easymotion/vim-easymotion'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'mbbill/undotree'

Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'pechorin/any-jump.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }

" Git integration:
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'iberianpig/tig-explorer.vim'

Plug 'rbgrouleff/bclose.vim'

Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'

" TODO:
Plug 'awetzel/elixir.nvim'
Plug 'Shougo/echodoc.vim'

Plug 'Shougo/context_filetype.vim'

" Comments:
Plug 'tpope/vim-commentary'

Plug 'ntpeters/vim-better-whitespace'

Plug 'tpope/vim-endwise'

Plug 'lmeijvogel/vim-yaml-helper'

Plug 'kassio/neoterm'
"Plug 'benekastah/neomake'

Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

Plug 'prettier/vim-prettier'

Plug 'fatih/vim-go'

Plug 'https://github.com/Alok/notational-fzf-vim'
Plug 'cohama/lexima.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug '907th/vim-auto-save'
Plug 'morhetz/gruvbox'
Plug 'psliwka/vim-smoothie'
Plug 'ap/vim-you-keep-using-that-word'
Plug 'rhysd/git-messenger.vim'
Plug 'rhysd/clever-f.vim'
Plug 'jpalardy/vim-slime'

Plug 'francoiscabrol/ranger.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'

Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'folke/trouble.nvim'
call plug#end()

let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
 set termguicolors
endif

set background=light
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'
colorscheme gruvbox

"Map leader to comma
let mapleader = ","

" Easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map  <Leader>f <Plug>(easymotion-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

nmap <Leader>e <Plug>(easymotion-overwin-line)

" Auto remove trailing whitespaces on save
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0
let g:strip_only_modified_lines=1

nnoremap <silent> <C-p> :FzfPreviewDirectoryFiles<CR>
nnoremap <silent> <C-l> :FzfPreviewProjectMrwFiles --add-fzf-arg=--no-sort<CR>

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set signcolumn=auto

let g:gitgutter_preview_win_floating = 1
let g:gitgutter_grep = 'rg'

nnoremap <leader>gg :GitGutterPreviewHunk<CR>

set nocursorcolumn
set cursorline
set re=1

" Neomake on save
"autocmd! BufWritePost * Neomake

" Unified clipboard
if has('nvim')
  set clipboard+=unnamedplus
endif

" Check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
set autoread
au CursorHold * checktime

" Tab completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Center screen on next/previous selection.
nmap n /<CR>zz
nmap N ?<CR>zz
" Last and next jump should center too.
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz

" Workaround for random text artifacts appearing after resizing tmux window
au VimResized * :redraw!
autocmd VimResized * exe "normal \<c-w>="


" Prevent first * from immediately jumping to the next occurrence
nnoremap * *``

" The escape key is a long ways away. This maps it to the sequence 'kj'
noremap! kj <esc>
nnoremap <esc> :noh<Enter>

let g:nv_search_paths = ['~/wiki', '~/writing', '~/code', 'notes.md']

let g:fzf_preview_command = 'batcat --theme="ansi-dark" --color=always --style=grid {-1}'
let g:fzf_preview_directory_files_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading'
let g:fzf_preview_lines_command = "awk '{if (NF>0) print NR, $0}'"
let g:fzf_preview_floating_window_rate = 0.9
let g:fzf_preview_use_dev_icons = 0
let g:fzf_preview_buffers_jump = 1

noremap :W :w

"call neomake#configure#automake('w')

let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 0

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-a> :TmuxNavigatePrevious<cr>

set updatetime=1000 " Affects cursorhold
let g:auto_save_events = ["CursorHold"]
let g:auto_save = 1

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
let g:slime_default_config = {"socket_name": "default", "target_pane": "5"}

function! SendRspecToTmux() abort
  execute 'silent SlimeSend1 be spring rspec ' . expand('%:p') . ':' . line('.')
endfunction

nmap <Leader>r :call SendRspecToTmux()<CR>

" Annoying folding, I don't need a wannabe WYSIWYG in Vim -.-
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0

let g:instant_markdown_autostart = 0
let g:instant_markdown_browser = "chromium"

set textwidth=0 wrapmargin=0

" Join line above
nnoremap K kJ

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
  },
  indent = {
    enable = true
  }
}

require'treesitter-context.config'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
}

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

nvim_lsp.solargraph.setup {
  flags = {
    debounce_text_changes = 150,
  }
}

nvim_lsp.bashls.setup({})

local servers = { "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

require("trouble").setup {
   icons = false
}

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}

EOF

highlight LspDiagnosticsDefaultError guifg=grey
highlight LspDiagnosticsDefaultWarning guifg=grey
highlight LspDiagnosticsDefaultInformation guifg=grey
highlight LspDiagnosticsDefaultHint guifg=grey
highlight LspDiagnosticsVirtualTextError guifg=grey
highlight LspDiagnosticsVirtualTextWarning guifg=grey
highlight LspDiagnosticsVirtualTextInformation guifg=grey
highlight LspDiagnosticsVirtualTextHint guifg=grey
highlight LspDiagnosticsUnderlineError guifg=grey
highlight LspDiagnosticsUnderlineWarning guifg=grey
highlight LspDiagnosticsUnderlineInformation guifg=grey
highlight LspDiagnosticsUnderlineHint guifg=grey
highlight LspDiagnosticsFloatingError guifg=grey
highlight LspDiagnosticsFloatingWarning guifg=grey
highlight LspDiagnosticsFloatingInformation guifg=grey
highlight LspDiagnosticsFloatingHint guifg=grey
highlight LspDiagnosticsSignError guifg=grey
highlight LspDiagnosticsSignWarning guifg=grey
highlight LspDiagnosticsSignInformation guifg=grey
highlight LspDiagnosticsSignHint guifg=grey

au FileType rb,ruby let b:prettier_exec_cmd = "rbprettier"

let g:ranger_replace_netrw = 1
let g:ranger_map_keys = 0
nmap - :Ranger<CR>

function! WriteRoomToggle()
  let l:name = '_writeroom_'
  if bufwinnr(l:name) > 0
    wincmd o
  else
    let l:width = (&columns - &textwidth) / 5
    execute 'topleft' l:width . 'vsplit +setlocal\ nobuflisted' l:name | wincmd p
    execute 'botright' l:width . 'vsplit +setlocal\ nobuflisted' l:name | wincmd p
    endif
endfunction

map <silent><Leader>v :call WriteRoomToggle()<CR>

let g:nv_create_note_window = 'vertical split'
nnoremap <c-s> :NV<CR>

noremap <Leader>q :tab split<CR>

set switchbuf="usetab"
