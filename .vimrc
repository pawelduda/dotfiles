set shell=/bin/zsh

set guicursor=

set title

" Removed in Neovim, keeping this for backwards compatibility
set mouse=a
set nolazyredraw
set noswapfile

set eol

set listchars=eol:¬,tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set list
set shada='1000

" Move vertically by rows rather than lines (useful with long lines + wrap on)
nnoremap j gj
nnoremap k gk

" Navigate quickfix entries
map <S-C-j> :cn<CR>zz
map <S-C-k> :cp<CR>zz

" Automatically indent pasted text
" nnoremap p p=`]
"nmap =p p`[v`]==
"nmap =P P`[v`]==

set sidescroll=5
set scrolloff=1

set shortmess-=S
set shortmess+=I

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

" No beep or flash
set belloff=all

set hidden
set sessionoptions=resize,winpos,winsize,buffers,tabpages,

set splitright
set splitbelow

" Encoding:
set fileencoding=utf-8

" Search:
set hlsearch

set ignorecase
set smartcase
set incsearch

set autoindent
set expandtab
set shiftwidth=2
set smarttab
set softtabstop=2

" Ruler:
" set ruler
set colorcolumn=120

" Live preview of Ex commands
set inccommand=nosplit

call plug#begin('~/.vim/plugged')

" Plug 'easymotion/vim-easymotion'
" Plug 'ggandor/leap.nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'mbbill/undotree'

Plug 'lukas-reineke/indent-blankline.nvim'

Plug 'ibhagwan/fzf-lua', { 'branch': 'main' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" Git integration:
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'iberianpig/tig-explorer.vim'

Plug 'rbgrouleff/bclose.vim'

" Plug 'itchyny/lightline.vim'
" Plug 'shinchu/lightline-gruvbox.vim'

" TODO:
Plug 'awetzel/elixir.nvim'

" Comments:
Plug 'tpope/vim-commentary'

Plug 'ntpeters/vim-better-whitespace'

Plug 'tpope/vim-endwise'

" Plug 'lmeijvogel/vim-yaml-helper'

" Plug 'Einenlum/yaml-revealer'

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

" Plug 'psliwka/vim-smoothie'
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

Plug 'nvim-treesitter/nvim-treesitter', { 'branch': 'master' }
Plug 'nvim-treesitter/nvim-treesitter-context'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
" Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/nvim-compe'
" Plug 'andersevenrud/compe-tmux', { 'branch': 'compe' }

Plug 'nvim-lua/plenary.nvim'
Plug 'pmizio/typescript-tools.nvim'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}

" Plug 'folke/trouble.nvim'

Plug 'folke/lsp-colors.nvim'

" Solidity
Plug 'thesis/vim-solidity'

" Center buffer contents horizontally
Plug 'folke/zen-mode.nvim'

" Search improvements
Plug 'kevinhwang91/nvim-hlslens'

" Misc functionality
Plug 'echasnovski/mini.nvim'

Plug 'godlygeek/tabular'
call plug#end()

" let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" if (has("termguicolors"))
 set termguicolors
" endif

" set background=light
set background=dark
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_contrast_light = 'hard'

" colorscheme tokyonight
colorscheme gruvbox

"Map leader to comma
let mapleader = ","

" fzf-lua
nnoremap <silent> <C-p> :lua require('fzf-lua').git_files()<CR>
nnoremap <silent> <C-l> :lua require('fzf-lua').oldfiles({ sort_lastused = true, include_current_session = true, fzf_opts = { ['--no-sort'] = '' } })<CR>
nnoremap <silent> <C-\> :lua require('fzf-lua').lines()<CR>
nnoremap <silent> <C-g> :lua require('fzf-lua').git_status()<CR>

nnoremap \ :lua require('fzf-lua').live_grep()<CR>
nnoremap ]\ :lua require('fzf-lua').grep_cword()<CR>
xnoremap \ :lua require('fzf-lua').grep_visual()<CR>

" Auto remove trailing whitespaces on save
" let g:better_whitespace_enabled=0
" let g:strip_whitespace_on_save=1
" let g:strip_whitespace_confirm=0
" let g:strip_only_modified_lines=1

set wildignore+=*/tmp/*,*.so,*.swp,*.zip

set signcolumn=auto

nnoremap <leader>gg :lua require('gitsigns').preview_hunk()<CR>
nnoremap <leader>gh :Gitsigns setqflist all<CR>

" Disable due to potential perf impact
set nocursorcolumn
set cursorline
set re=0

" Neomake on save
"autocmd! BufWritePost * Neomake

" Unified clipboard
if has('nvim')
  set clipboard+=unnamedplus
endif

" Check file change every 4 seconds ('CursorHold') and reload the buffer upon detecting change
" set autoread
" au CursorHold * checktime

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
let g:slime_default_config = {"socket_name": "default", "target_pane": "6"}

function! SendRspecToTmux() abort
  " execute 'silent SlimeSend1 be spring rspec ' . expand('%:p') . ':' . line('.')
  " execute 'silent SlimeSend1 spring bin/rails test ' . expand('%:p') . ':' . line('.')
  execute 'silent SlimeSend1 spring rails test ' . expand('%:p') . ':' . line('.')
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
-- require('leap').set_default_keymaps()
local luasnip = require('luasnip')

-- Suppress ruby-lsp-rails "pending migrations" showMessageRequest prompt.
-- Matched specifically on the "Run Migrations" action title that the addon injects.
local orig_show_message_request = vim.lsp.handlers["window/showMessageRequest"]
vim.lsp.handlers["window/showMessageRequest"] = function(err, result, ctx, config)
  if result and result.actions then
    for _, action in ipairs(result.actions) do
      if action.title == "Run Migrations" then
        return vim.NIL
      end
    end
  end
  return orig_show_message_request(err, result, ctx, config)
end

-- Silence benign NO_RESULT_CALLBACK_FOUND errors: nvim cancels in-flight
-- requests (diagnostics, semantic tokens) on edit and drops the callback,
-- but ruby-lsp may have already sent the result. The orphaned response is
-- harmless. Suppress only this error code; all other LSP errors pass through.
do
  local Client = require('vim.lsp.client')
  local orig_write_error = Client.write_error
  Client.write_error = function(self, code, err)
    if code == vim.lsp.client_errors.NO_RESULT_CALLBACK_FOUND then
      return
    end
    return orig_write_error(self, code, err)
  end
end

require("fidget").setup()
require("mason").setup()

require('fzf-lua').setup({
  defaults = {
  },
  previewers = {
    builtin = {
      syntax_limit_b = 1024 * 100, -- disable treesitter preview above 100KB
      treesitter = { enabled = true, disabled = { "markdown", "markdown_inline" } },
    },
  },
  winopts = {
    fullscreen = true,
    preview = {
      default = 'builtin', -- use the Neovim buffer previewer
    },
  },
})

vim.o.splitkeep = "screen"

-- vim.g.tokyonight_style = "storm"
-- vim.g.tokyonight_italic_functions = true

require'nvim-treesitter.configs'.setup {
  ensure_installed = {
    "ruby", "javascript", "typescript", "tsx",
    "elixir", "heex", "eex", "go", "gomod", "lua", "solidity",
    "json", "yaml", "html", "css", "scss", "bash",
    "markdown", "markdown_inline", "vim", "vimdoc", "regex", "git_config",
  },
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

require("treesitter-context").setup({ enable = false })

vim.diagnostic.config({
  underline = false,
  virtual_text = false,
  signs = false,
  update_in_insert = false,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.hover, opts)
  end,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local path_to_elixirls = vim.fn.expand("~/Programming/elixir-ls/rel/language_server.sh")

vim.lsp.config('elixirls', {
  cmd = {path_to_elixirls},
  capabilities = capabilities,
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
      fetchDeps = false,
    }
  }
})

vim.lsp.config('ruby_lsp', {
  cmd = { 'bundle', 'exec', 'ruby-lsp' },
  capabilities = capabilities,
})

vim.lsp.config('bashls', {
  capabilities = capabilities,
})

vim.lsp.enable({'elixirls', 'ruby_lsp', 'bashls'})

require("typescript-tools").setup {
  capabilities = capabilities,
  settings = {
    tsserver_max_memory = 12288,
    tsserver_file_preferences = {
      includePackageJsonAutoImports = "off",  -- reduces memory from scanning all packages
    },
  },
}

 --require("trouble").setup {
    --icons = false;
    --mode = "quickfix";
 --}

vim.o.completeopt = "menu,menuone,noselect"

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
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

-- Prevent stripping EOL on save
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "BufWritePost" }, {
  pattern = "*",
  command = "setl fixeol"
})

require('mini.colors').setup()
-- require('mini.animate').setup()

-- Triger `autoread` when files changes on disk
-- https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
-- https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
vim.api.nvim_create_autocmd({'FocusGained', 'BufEnter', 'CursorHold', 'CursorHoldI'}, {
  pattern = '*',
  command = "if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif",
})

-- Notification after file change
-- https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
vim.api.nvim_create_autocmd({'FileChangedShellPost'}, {
  pattern = '*',
  command = "echohl WarningMsg | echo 'File changed on disk. Buffer reloaded.' | echohl None",
})

require('gitsigns').setup({
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 250,
    virt_text_pos = 'eol',
  },
})

vim.api.nvim_set_hl(0, 'GitSignsCurrentLineBlame', { fg = '#a89984', italic = true })

-- Hunk picker (<leader>gs): one entry per hunk (fzf-lua's git_hunks lists every changed line)
local function git_hunk_header_entry(x, opts)
  local S = opts.__hunk_header_state or {}
  opts.__hunk_header_state = S
  local l = require('fzf-lua.utils').strip_ansi_coloring(x)
  if l:match('^diff ') then
    S.filename, S.in_header = nil, true
    return
  end
  if S.in_header then
    local file = l:match('^%+%+%+ %l/(.*)')
    if file then S.filename = file end
  end
  local line = l:match('^@@ %-%d+,?%d* %+(%d+)')
  if line then
    S.in_header = false
    if S.filename then
      return string.format('%s:%d:%s', require('fzf-lua.make_entry').file(S.filename, opts), math.max(tonumber(line), 1), x)
    end
  end
end

vim.keymap.set('n', '<leader>gs', function()
  require('fzf-lua').git_hunks({
    cmd = 'git --no-pager diff --color=always -U0 HEAD',
    multiprocess = false,
    fn_transform = git_hunk_header_entry,
  })
end, { desc = 'Git hunks picker, one entry per hunk' })

-- Copy full Ruby namespace of current file to clipboard (<leader>yn)
local ruby_app_dirs = {
  'app/services/', 'app/models/', 'app/controllers/',
  'app/jobs/', 'app/queries/', 'app/mappers/', 'app/validators/',
}
vim.keymap.set('n', '<leader>yn', function()
  local filepath = vim.fn.expand('%:p')
  local relative = nil
  for _, dir in ipairs(ruby_app_dirs) do
    local _, e = filepath:find(dir, 1, true)
    if e then relative = filepath:sub(e + 1); break end
  end
  if not relative then
    vim.notify('[ruby_ns] No app/ directory found in path', vim.log.levels.WARN)
    return
  end
  relative = relative:gsub('%.rb$', '')
  local parts = vim.split(relative, '/')
  local ns = table.concat(vim.tbl_map(function(s)
    s = s:sub(1, 1):upper() .. s:sub(2)
    return s:gsub('_(.)', function(c) return c:upper() end)
  end, parts), '::')
  vim.fn.setreg('+', ns)
  vim.notify('[ruby_ns] Copied: ' .. ns, vim.log.levels.INFO)
end, { desc = 'Copy Ruby namespace to clipboard' })

EOF

au FileType ruby let b:prettier_exec_cmd = "rbprettier"

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

set switchbuf=usetab

set nofoldenable

" Disable ctags entirely — use LSP for all symbol navigation
set tags=

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
