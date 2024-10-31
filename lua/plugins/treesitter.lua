return {
  {
    'nvim-treesitter/nvim-treesitter', 
    build = ':TSUpdate',
    config = function ()
      local config = require('nvim-treesitter.configs')
      config.setup({
        ensure_installed = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'query', 'vim', 'vimdoc', 'javascript', 'css', 'go', 'json', 'php', 'python', 'typescript' },
        -- auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  }
}
