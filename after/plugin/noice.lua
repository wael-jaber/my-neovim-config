local ok, noice = pcall(require, 'noice')
if not ok then return end

noice.setup({
  presets = {
    command_palette = true,
    long_message_to_split = true,
    lsp_doc_border = true,
  },
})
