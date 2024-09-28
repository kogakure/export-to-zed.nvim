# export-to-zed.nvim

## About

This Neovim plugin takes all active buffers and opens them as tabs in [Zed](https://zed.dev/) while preserving the position of the cursor in the files.

## Requirements

Neovim >= 0.7.0

## Installation

This plugin can be installed with any of the popular package managers. For example, with [lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
  "kogakure/export-to-zed.nvim",
  lazy = false,
  keys = {
    { "<leader>zed", "<CMD>ExportToZed<CR>", desc = "Export to Zed" },
  },
  config = function()
    require("export-to-zed").setup()
  end,
}
```

When the plugin is loaded it exports the `ExportToZed` command. You can also directly trigger the command with `lua require("export-to-zed").export_to_zed()`.

## Acknowledgements

Inspired by Elijah Manor’s plugin [export-to-vscode.nvim](https://github.com/elijahmanor/export-to-vscode.nvim).
