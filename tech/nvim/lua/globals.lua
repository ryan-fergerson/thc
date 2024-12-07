P = function(v)
  print(vim.inspect(v))
  return v
end

function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }

  if opts then
    options = vim.tbl_extend('force', options, opts)
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function n(lhs, rhs, opts)
  map('n', lhs, rhs, opts)
end

function v(lhs, rhs, opts)
  map('v', lhs, rhs, opts)
end

function i(lhs, rhs, opts)
  map('i', lhs, rhs, opts)
end

-- multi, many, mixed
function m(lhs, rhs, opts)
  map('', lhs, rhs, opts)
end

