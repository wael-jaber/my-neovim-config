local M = {}

function M.find_project_binary(bufnr, binary, subdir)
  subdir = subdir or 'node_modules/.bin'
  local buf_path = vim.api.nvim_buf_get_name(bufnr or 0)
  if buf_path == '' then return binary end

  local dir = vim.fn.fnamemodify(buf_path, ':h')

  local found = vim.fs.find(function(name)
    return name == subdir
  end, {
    path = dir,
    upward = true,
    type = 'directory',
    stop = vim.env.HOME,
  })

  if #found > 0 then
    local candidate = found[1] .. '/' .. binary
    if vim.fn.executable(candidate) == 1 then
      return candidate
    end
  end

  return binary
end

return M
