# Config file for [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim) and [whichkey](https://github.com/VSpaceCode/vscode-which-key) using [Lua](https://www.lua.org/)

Keybindings are inspired by [LunarVim](https://github.com/lunarvim/lunarvim)

## Installation (Linux debian)

Clone this repository into `.config` directory.
Then put the following setting in your `VSCode config JSON file`:

```json
{
	"vscode-neovim.neovimInitVimPaths.linux": "$HOME/.config/vscode-nvim/init.lua"
}
```
