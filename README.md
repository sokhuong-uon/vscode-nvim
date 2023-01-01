# Config file for [VSCode Neovim](https://github.com/vscode-neovim/vscode-neovim) and [whichkey](https://github.com/VSpaceCode/vscode-which-key) using [Lua](https://www.lua.org/)

Keybindings are inspired by [LunarVim](https://github.com/lunarvim/lunarvim)

## Installation (Linux debian)

**Requirements**:

- Have [Neovim](https://neovim.io/) in your machine.
- Already install [VSCode Neovim](https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim) and [Which Key](https://marketplace.visualstudio.com/items?itemName=VSpaceCode.whichkey) extensions in VSCode.

Setup

- Clone this repository into `.config` directory.
- Then put the following setting in your `VSCode config JSON file`:

```json
{
	"vscode-neovim.neovimExecutablePaths.linux": "/path/to/your/nvim",
	"vscode-neovim.neovimInitVimPaths.linux": "$HOME/.config/vscode-nvim/init.lua"
}
```
