local whichkey = require("whichkey")
local comment  = require("comment")
local file     = require("file")
local problem  = require("problem")
local editor   = require("editor")

vim.g.mapleader = " "

vim.keymap.set({ 'n', 'v' }, "<leader>", whichkey.show)
vim.keymap.set({ 'n', 'v' }, "<leader>/", comment.selected)

-- File
vim.keymap.set({ 'n', 'v' }, "<space>w", file.save)

-- Problems / troubles
vim.keymap.set({ 'n', 'v' }, "<space>t", problem.toggle)

-- Editor
vim.keymap.set({ 'n', 'v' }, "H", editor.previous)
vim.keymap.set({ 'n', 'v' }, "L", editor.next)
vim.keymap.set({ 'n', 'v' }, "<space>c", editor.closeActive)
