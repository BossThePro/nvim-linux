local util = require 'lspconfig.util'

-- Define root_files for Python
local python_root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
  '.git',
}

-- Python (Pyright)
require('lspconfig').pyright.setup{
  cmd = { 'pyright-langserver', '--stdio' },
  filetypes = { 'python' },
  root_dir = function(fname)
    return util.root_pattern(unpack(python_root_files))(fname)
  end,
  single_file_support = true,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
      },
    },
  }
}

-- C++ (clangd)
require('lspconfig').clangd.setup{
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
  root_dir = util.root_pattern(
    '.clangd',
    '.clang-tidy',
    '.clang-format',
    'compile_commands.json',
    'compile_flags.txt',
    'configure.ac',
    '.git'
  ),
  single_file_support = true,
}

-- TypeScript/JavaScript (tsserver)
require('lspconfig').ts_ls.setup{
  cmd = { 'typescript-language-server', '--stdio' },
  filetypes = { 'javascript', 'javascriptreact', 'javascript.jsx', 'typescript', 'typescriptreact', 'typescript.tsx' },
  root_dir = util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git'),
  single_file_support = true,
}
