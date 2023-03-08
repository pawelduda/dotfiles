set shell=/bin/zsh

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=

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

" Navigate quickfix entries
map <C-j> :cn<CR>zz
map <C-k> :cp<CR>zz

" Automatically indent pasted text
nnoremap p p=`]
"nmap =p p`[v`]==
"nmap =P P`[v`]==
"
set sidescroll=5
set scrolloff=1

set shortmess-=S
" Mouse support

set timeoutlen=1000 ttimeoutlen=0

set number
set norelativenumber

set noshowmode
" Use global statusline
" set laststatus=3
set showtabline=2

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

" Live preview of Ex commands
set inccommand=nosplit

call plug#begin('~/.vim/plugged')
Plug 'xolox/vim-misc'

" Plug 'easymotion/vim-easymotion'
Plug 'ggandor/leap.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'mbbill/undotree'

Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }

Plug 'pechorin/any-jump.vim'

" Git integration:
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'iberianpig/tig-explorer.vim'

Plug 'rbgrouleff/bclose.vim'

" Plug 'itchyny/lightline.vim'
" Plug 'shinchu/lightline-gruvbox.vim'

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

" Plug 'prettier/vim-prettier'

Plug 'fatih/vim-go'

Plug 'cohama/lexima.vim'

Plug 'christoomey/vim-tmux-navigator'
Plug '907th/vim-auto-save'

" Plug 'folke/tokyonight.nvim'
Plug 'morhetz/gruvbox'

Plug 'psliwka/vim-smoothie'
Plug 'ap/vim-you-keep-using-that-word'
Plug 'rhysd/git-messenger.vim'
Plug 'rhysd/clever-f.vim'
Plug 'jpalardy/vim-slime'

Plug 'francoiscabrol/ranger.vim'

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Useful status updates for LSP
Plug 'j-hui/fidget.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/nvim-compe'
" Plug 'andersevenrud/compe-tmux', { 'branch': 'compe' }

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'luukvbaal/stabilize.nvim'
" Plug 'folke/trouble.nvim'

Plug 'folke/lsp-colors.nvim'

" Solidity
Plug 'thesis/vim-solidity'

" Center buffer contents horizontally
Plug 'folke/zen-mode.nvim'

" Search improvements
Plug 'kevinhwang91/nvim-hlslens'

call plug#end()

" let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
if (has("termguicolors"))
 set termguicolors
endif

set background=dark
let g:gruvbox_contrast_dark = 'hard'
" let g:gruvbox_contrast_light = 'soft'
" colorscheme tokyonight
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

" nnoremap \ :Rg!<SPACE>
nnoremap \ :Telescope live_grep default_text=
" xnoremap \ y:Rg!<SPACE><C-r>"<CR>
xnoremap \ y:Telescope live_grep default_text=<C-r>"<CR>

let g:lightline = {
      \ 'colorscheme': 'tokyonight',
      \ }


" This function has very bad performance!!!
" let g:lightline = {
"       \ 'colorscheme': 'tokyonight',
"       \ 'component_function': {
"         \   'filename': 'LightlineFilename'
"         \ },
"         \ }

" function! LightlineFilename()
"   let root = fnamemodify(get(b:, 'git_dir'), ':h')
"   let path = expand('%:p')
"   if path[:len(root)-1] ==# root
"     return path[len(root)+1:]
"   endif
"   return expand('%')
" endfunction

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set signcolumn=auto

let g:gitgutter_preview_win_floating = 1
let g:gitgutter_grep = 'rg'

nnoremap <leader>gg :GitGutterPreviewHunk<CR>

set cursorcolumn
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
nmap <silent> n /<CR>zz
nmap <silent> N ?<CR>zz
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

set updatetime=500 " Affects cursorhold
" let g:auto_save_events = ["CursorHold"]
" let g:auto_save = 1

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
  " execute 'silent SlimeSend1 be spring rspec ' . expand('%:p') . ':' . line('.')
  execute 'silent SlimeSend1 sr ' . expand('%:p') . ':' . line('.')
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
require('leap').set_default_keymaps()

require("stabilize").setup()
require("mason").setup()

-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,
    disable = {},  -- list of language that will be disabled
  },

  indent = {
    enable = true
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      scope_incremental = '<CR>',
      node_incremental = '<TAB>',
      node_decremental = '<S-TAB>',
    },
  },
}

require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
}

vim.lsp.handlers["textDocument/publishDiagnostics"] =
vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = false,
  virtual_text = { spacing = 10 },
  signs = false,
  update_in_insert = false
})

local nvim_lsp = require('lspconfig')

-- Finally, let's initialize the Elixir language server

-- Replace the following with the path to your installation
local path_to_elixirls = vim.fn.expand("~/Programming/elixir-ls/rel/language_server.sh")

nvim_lsp.elixirls.setup({
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
  elixirLS = {
    -- I choose to disable dialyzer for personal reasons, but
    -- I would suggest you also disable it unless you are well
    -- aquainted with dialzyer and know how to use it.
    dialyzerEnabled = false,
    -- I also choose to turn off the auto dep fetching feature.
    -- It often get's into a weird state that requires deleting
    -- the .elixir_ls directory and restarting your editor.
    fetchDeps = false
    }
  }
})

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

nvim_lsp.solargraph.setup {
  flags = {
    debounce_text_changes = 150,
  }
}

local servers = { "bashls", "solargraph" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

 --require("trouble").setup {
    --icons = false;
    --mode = "quickfix";
 --}

vim.o.completeopt = "menu,menuone,noselect"

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { width = 0.99, height = 0.99 },
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
}

require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-l>', builtin.oldfiles, {})
vim.keymap.set('n', '<Leader><Leader>', builtin.jumplist, {})
vim.keymap.set('n', '<C-\\>', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<Leader>l', builtin.resume, {})
-- :Telescope find_files default_text=keymaps

require("zen-mode").setup {
  window = {
    backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
    -- height and width can be:
    -- * an absolute number of cells when > 1
    -- * a percentage of the width / height of the editor when <= 1
    -- * a function that returns the width or the height
    width = 160, -- width of the Zen window
    height = 1, -- height of the Zen window
    -- by default, no options are changed for the Zen window
    -- uncomment any of the options below, or add other vim.wo options you want to apply
    options = {
      -- signcolumn = "no", -- disable signcolumn
      -- number = false, -- disable number column
      -- relativenumber = false, -- disable relative numbers
      -- cursorline = false, -- disable cursorline
      -- cursorcolumn = false, -- disable cursor column
      -- foldcolumn = "0", -- disable fold column
      -- list = false, -- disable whitespace characters
    },
  },
  plugins = {
    -- disable some global vim options (vim.o...)
    -- comment the lines to not apply the options
    options = {
      enabled = true,
      ruler = false, -- disables the ruler text in the cmd line area
      showcmd = false, -- disables the command in the last line of the screen
    },
    twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
    gitsigns = { enabled = false }, -- disables git signs
    tmux = { enabled = false }, -- disables the tmux statusline
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    kitty = {
      enabled = false,
      font = "+4", -- font size increment
    },
    -- this will change the font size on alacritty when in zen mode
    -- requires  Alacritty Version 0.10.0 or higher
    -- uses `alacritty msg` subcommand to change font size
    alacritty = {
      enabled = false,
      font = "14", -- font size
    },
  },
  -- callback where you can add custom code when the Zen window opens
  on_open = function(win)
  end,
  -- callback where you can add custom code when the Zen window closes
  on_close = function()
  end,
}

require('hlslens').setup()

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', '<Cmd>noh<CR>', kopts)
EOF

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

noremap <Leader>q :tab split<CR>

set switchbuf="usetab"

set nofoldenable

" This is only needed for parcel
set backupcopy=yes

" Sort quickfix entries
function! s:CompareQuickfixEntries(i1, i2)
  if bufname(a:i1.bufnr) == bufname(a:i2.bufnr)
    return a:i1.lnum == a:i2.lnum ? 0 : (a:i1.lnum < a:i2.lnum ? -1 : 1)
  else
    return bufname(a:i1.bufnr) < bufname(a:i2.bufnr) ? -1 : 1
  endif
endfunction

function SortUniqQFList()
  let sortedList = sort(getqflist(), 's:CompareQuickfixEntries')
  let uniqedList = []
  let last = ''
  for item in sortedList
    let this = bufname(item.bufnr) . "\t" . item.lnum
    if this !=# last
      call add(uniqedList, item)
      let last = this
    endif
  endfor
  call setqflist(uniqedList)
endfunction

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction
" set statusline+=%{GitStatus()}

let g:vim_yaml_helper#auto_display_path = 0
