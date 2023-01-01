local whichkey = {
  show = function()
    vim.fn.VSCodeNotify("whichkey.show")
  end
}

local comment = {
  selected = function()
    vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
  end
}

local file = {
  save = function()
    vim.fn.VSCodeNotify("workbench.action.files.save")
  end
}

local problem = {
  toggle = function()
    vim.fn.VSCodeNotify("workbench.actions.view.toggleProblems")
  end
}

local editor = {
  previous = function()
    vim.fn.VSCodeNotify("workbench.action.previousEditor")
  end,

  next = function()
    vim.fn.VSCodeNotify("workbench.action.nextEditor")
  end,

  closeActive = function()
    vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
  end
}

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
