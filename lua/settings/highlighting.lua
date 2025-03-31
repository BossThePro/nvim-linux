-- Configure diagnostics to show on the right side as virtual text
vim.diagnostic.config({
  virtual_text = {
    prefix = '■', -- You can change this to any character you prefer
    source = "if_many",
    format = function(diagnostic)
      return string.format("%s: %s", diagnostic.source, diagnostic.message)
    end,
  },
  float = {
    source = "always",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- If you want to customize the appearance of the virtual text
vim.cmd [[
  highlight DiagnosticVirtualTextError guifg=#DB4B4B gui=italic,bold
  highlight DiagnosticVirtualTextWarn guifg=#E0AF68 gui=italic,bold
  highlight DiagnosticVirtualTextInfo guifg=#0DB9D7 gui=italic,bold
  highlight DiagnosticVirtualTextHint guifg=#10B981 gui=italic,bold
]]
