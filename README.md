# Config file for [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim) and [whichkey](https://github.com/VSpaceCode/vscode-which-key) using [Lua](https://www.lua.org/)

Keybindings are inspired by [LunarVim](https://github.com/lunarvim/lunarvim)

## What it looks like

```lua
-- whichkey.lua

local whichkey = {}

function whichkey.show()
  vim.fn.VSCodeNotify("whichkey.show")
end

return whichkey
```

```lua
-- comment.lua

local comment = {}

function comment.selected()
  vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
end

return comment
```

Then in init.lua

```lua
-- init.lua

local whichkey = require "whichkey"
local comment  = require "comment"

vim.g.mapleader = " "

vim.keymap.set({ 'n', 'v' }, "<leader>", whichkey.show)
vim.keymap.set({ 'n', 'v' }, "<leader>/", comment.selected)
```

## Installation (Linux debian)

Clone this repository into `.config` directory.
Then put the following setting in your `VSCode config JSON file`:

```json
	"vscode-neovim.neovimInitVimPaths.linux": "$HOME/.config/vscode-nvim/init.lua",
```
