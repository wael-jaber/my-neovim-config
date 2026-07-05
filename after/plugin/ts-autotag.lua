local ok = pcall(require, 'nvim-ts-autotag')
if not ok then return end
require('nvim-ts-autotag').setup()
