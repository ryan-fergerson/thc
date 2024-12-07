-- This is the default option:
--   - Preview window on the right with 50% width
--   - CTRL-/ will toggle preview window.
-- - Note that this array is passed as arguments to fzf#vim#with_preview function.
-- - To learn more about preview window options, see `--preview-window` section of `man fzf`.
--vim.g.fzf_vim = {}
--vim.g.fzf_vim.preview_window = {'right,85%'}
vim.cmd[[
  let g:fzf_vim = {}
  let g:fzf_vim.preview_window = ['up,80%', 'ctrl-p']
]]

vim.api.nvim_set_keymap('i', '<c-x><c-k>', "<plug>(fzf-complete-word)", { noremap = true, silent = true });
vim.api.nvim_set_keymap('i', '<c-x><c-f>', "<plug>(fzf-complete-path)", { noremap = true, silent = true });
vim.api.nvim_set_keymap('i', '<c-x><c-l>', "<plug>(fzf-complete-line)", { noremap = true, silent = true });
vim.api.nvim_set_var('fzf_layout', { window = '-tabnew' })
