-- mnemonics
--
-- COMMANDS
-- x and , (for eXecute and COMMAnd)
--
-- SEARCHES
-- / and z (/ is regular search, z mirrors)
--
-- TOGGLES
-- ; and a ("semi-colon switch", a mirrors)

vim.g.mapleader = ' '

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function n(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

local function v(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

local function i(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

-- multi, many, mixed
local function m(lhs, rhs, opts)
  map('', lhs, rhs, opts)
end

-----------
-- UNMAP --
-----------
m('C-@', '<NOP>')
m('<Space>', '<NOP>')

-------------
-- GENERAL --
-------------
-- Treat wrapped lines as new lines
m('j', 'gj')
m('k', 'gk')

-- Easy escape
n('<C-Space>', '<ESC>')
i('<C-Space>', '<ESC>')

-- Fix syntax highlighting
-- https://vim.fandom.com/wiki/Fix_syntax_highlighting
n('<Leader>,,', '<Esc>:syntax sync fromstart<CR>')

-- Yank to clipboard
n('<Leader>y', ':%y+<CR>') -- yank whole file
v('<Leader>y', '"+y')      -- yank selection

-- Paste from clipboard
n('<Leader>p', '"+p')
n('<Leader>P', '"+P')

-- Easy options
n('<Leader>,o', ':options<CR>:winc T<CR>')
n('<Leader>xo', ':options<CR>:winc T<CR>')

-- Easy source
n('<Leader>,r', ':luafile %<CR>')
n('<Leader>xr', ':luafile %<CR>')

-- Easy edit vim configuration files
n('<Leader>,v', ':tabedit ~/.config/nvim/lua/remaps.lua<CR> :vsp ~/.config/nvim/lua/options.lua<CR> :winc h<CR> 0gg')
n('<Leader>xv', ':tabedit ~/.config/nvim/lua/remaps.lua<CR> :vsp ~/.config/nvim/lua/options.lua<CR> :winc h<CR> 0gg')

-- Change to directory of the open buffer
n('<Leader>cd', ':cd %:p:h<CR>:pwd<CR>')

-- Save
n('<Leader>,w', ':w!<CR>')
n('<Leader>xw', ':w!<CR>')

-- Easy visual-block mode
n('<Leader>v', '<C-v>')

-- Easy redo (undo undo)
n('<Leader>u', '<C-r>')

-- Disable highlight
n('<Leader><CR>', ':noh<CR>')

-- Horizontally scroll holding control
-- https://github.com/alacritty/alacritty/issues/2185
n('<C-ScrollWheelDown>'  , '10zl')
n('<C-2-ScrollWheelDown>', '10zl')
n('<C-3-ScrollWheelDown>', '10zl')
n('<C-4-ScrollWheelDown>', '10zl')
n('<C-ScrollWheelUp>'    , '10zh')
n('<C-2-ScrollWheelUp>'  , '10zh')
n('<C-3-ScrollWheelUp>'  , '10zh')
n('<C-4-ScrollWheelUp>'  , '10zh')

-------------------------------
-- HELP or HYPERTEXT or HREF --
-------------------------------
-- fast help
n('<Leader>,h', ':tab help<CR>')
n('<Leader>xh', ':tab help<CR>')

-- help find
n('<Leader>hf', ':help<Space>')

-- help here (jump into/through links in help)
n('<Leader>hh', '<c-]>')

-- help jump back
n('<Leader>hb', '<c-o>')

-- fast jump to index.txt (ALL commands)
n('<Leader>,i', ':tab help index.txt<CR>')
n('<Leader>xi', ':tab help index.txt<CR>')
n('<Leader>,ff', ':set ft=<CR>')
n('<Leader>xff', ':set ft=<CR>')
n('<Leader>,fm', ':set ft=markdown<CR>')
n('<Leader>xfm', ':set ft=markdown<CR>')
n('<Leader>,fj', ':set ft=javascript<CR>')
n('<Leader>xfj', ':set ft=javascript<CR>')
n('<Leader>,fn', ':set ft=json<CR>')
n('<Leader>xfn', ':set ft=json<CR>')

-----------
-- MARKS --
-----------
-- Jump to exact position
n('<Leader>jj', '`')

-- Jump to line
n('<Leader>jl', '\'')

-- wild search files
-- https://www.reddit.com/r/vim/comments/8p51l6/get_result_of_find_command_up_in_a_quickfix/
-- nnoremap <leader>aa :args<cr>
-- nnoremap <leader>af :args `find . -name '' -print`<left><left><left><left><left><left><left><left><left>
-- nnoremap <leader>a<leader> :n<cr>
-- nnoremap <leader><leader>a :prev<cr>

-- easy diff
n('<Leader>dt', ':windo diffthis<CR>')
n('<Leader>df', ':windo diffoff<CR>')

-- insert date
n('<Leader>id', '"=strftime(\'%Y%m%d\')<CR>P')

-- bind cursor in all windows
-- nnoremap <leader>bc :call SetCursorBind()<cr>
-- nnoremap <leader>br :windo :call RemoveCursorBind()<cr>

------------
-- SEARCH --
------------
--vim.keymap.set("n", "<Leader>/s", function()
--  --vim.cmd [[execute "insert \<Plug>delimitMateCR"]]
--  vim.cmd[[execute "\<plug>(fzf-complete-word)"]]
--end)

n('<Leader>/g', ':GFiles<CR>')
n('<Leader>zg', ':GFiles<CR>')
n('<Leader>/d', ':Files ~/Downloads<CR>')
n('<Leader>zd', ':Files ~/Downloads<CR>')
n('<Leader>/s', ':Files ~/code<CR>')
n('<Leader>zs', ':Files ~/code<CR>')
n('<Leader>/c', ':Commits<CR>')
n('<Leader>zc', ':Commits<CR>')

local function ripgrep()
  return ":Rg! " .. vim.fn.input("ripgrep> ") .. "<cr>"
end

vim.keymap.set('n', '<Leader>zf', ripgrep, { expr = true })
vim.keymap.set('n', '<Leader>/f', ripgrep, { expr = true })

-------------
-- TOGGLES --
-------------
-- toggle wrap
n('<Leader>;w', ':setlocal wrap!<CR>')
n('<Leader>aw', ':setlocal wrap!<CR>')

-- toggle paste mode
n('<Leader>;p', ':setlocal paste!<CR>')
n('<Leader>ap', ':setlocal paste!<CR>')

-- toggle cursor line
n('<Leader>;c', ':set cursorline!<CR>')
n('<Leader>ac', ':set cursorline!<CR>')

-- toggle cursor line in all buffers in window
n('<Leader>;C', ':windo :set cursorline!<CR>')
n('<Leader>aC', ':windo :set cursorline!<CR>')

-- toggle color coloumn
n('<Leader>;l', ':set cursorcolumn!<CR>')
n('<Leader>al', ':set cursorcolumn!<CR>')
--n('<Leader>;L', ':call ColorColumnToggle()<CR>')

-- toggle list
n('<Leader>;s', ':set list!<CR>')
n('<Leader>as', ':set list!<CR>')

------------
-- SPLITS --
------------
-- opening/closing splits
n('<Leader>ss', ':new<CR>')
n('<Leader>sv', ':vnew<CR>')
n('<Leader>st', ':vsp<CR>')
n('<Leader>sT', ':sp<CR>')
n('<Leader>sq', ':q!<CR>')
n('<Leader>sc', ':close<CR>')

-- easy split sizing
n('<Leader>sf', ':winc |<CR>')
n('<Leader>se', ':winc =<CR>')
n('<Leader>so', ':winc o<CR>')
n('<Leader>sT', ':winc T<CR>')
n('<Leader>sp', ':vertical resize +20<CR>')
n('<Leader>sm', ':vertical resize -20<CR>')

-- easy split movement
n('<Leader>sJ', ':winc J<CR>')
n('<Leader>sK', ':winc K<CR>')
n('<Leader>sH', ':winc H<CR>')
n('<Leader>sL', ':winc L<CR>')

-- easy way to navigate between windows
n('<Leader>sj', ':winc j<CR>')
n('<Leader>sk', ':winc k<CR>')
n('<Leader>sh', ':winc h<CR>')
n('<Leader>sl', ':winc l<CR>')
n('<Leader>sn', ':winc l<CR>:winc |<CR>')
n('<Leader>sN', ':winc h<CR>:winc |<CR>')

----------
-- TABS --
----------
n('<Leader>tt', ':tabs<CR>')
n('<Leader>tn', ':tabnew<CR>')
n('<Leader>to', ':tabonly<CR>')

-------------
-- BUFFERS --
-------------
n('<Leader>bb', ':ls<CR>')
n('<Leader>bB', ':new<CR>')
n('<Leader>bj', ':bnext<CR>')
n('<Leader>bf', ':bprevious<CR>')

-- buffer close
n('<Leader>bq', ':bd<CR>')

-- buffer show
n('<Leader>bs', ':unhide<CR>')

-- close all the buffers
n('<Leader>ba', ':%bd<CR>')

-----------------
-- SPELL CHECK --
-----------------
-- toggle spell checking
n('<Leader>cc', ':setlocal spell!<CR>')
n('<Leader>cj', ']s')
n('<Leader>cf', '[s')
n('<Leader>ca', 'zg')
n('<Leader>c?', 'z=')

-------
-- tags
-------
-- nnoremap <leader>ft :tag<Space>
-- nnoremap <leader>fT :tselect<cr>
-- nnoremap <leader>fj g]
-- nnoremap <leader>fu [I
-- nnoremap <leader>t<leader> :tnext<cr>
-- nnoremap <leader><leader>t :tprevious<cr>

--------------------------
-- views-sessions-projects
--------------------------
-- nnoremap <leader>;; :call SaveProject("")<left><left>
-- nnoremap <leader>;: :call LoadProject("")<left><left>
-- nnoremap <leader>;f :call QuoteNumberList()<cr>
-- nnoremap <leader>;h :call MakeHashComment()<cr>
-- switching sessions
-- :nmap <F2> :wa<Bar>exe "mksession! " . v:this_session<CR>:so ~/sessions/

