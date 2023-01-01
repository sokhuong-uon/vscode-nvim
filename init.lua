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

local symbol = {
  rename = function()
    vim.fn.VSCodeNotify("editor.action.rename")
  end,
}

local search = {
  reference = function()
    vim.fn.VSCodeNotify("editor.action.referenceSearch.trigger")
  end,
  referenceInSideBar = function()
    vim.fn.VSCodeNotify("references-view.find")
  end,
  project = function()
    vim.fn.VSCodeNotify("editor.action.addSelectionToNextFindMatch")
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
  end,
  text = function()
    vim.fn.VSCodeNotify("workbench.action.findInFiles")
  end,
}

vim.g.mapleader = " "
vim.keymap.set({ 'n' }, "<leader>h", "<cmd>noh<cr>")

vim.keymap.set({ 'n', 'v' }, "<leader>", whichkey.show)
vim.keymap.set({ 'n', 'v' }, "<leader>/", comment.selected)
vim.keymap.set({ 'n' }, "<leader>rr", symbol.rename)

vim.keymap.set({ 'n' }, "<leader>sr", search.reference)
vim.keymap.set({ 'n' }, "<leader>sR", search.referenceInSideBar)
vim.keymap.set({ 'n' }, "<leader>sp", search.project)
vim.keymap.set({ 'n' }, "<leader>st", search.text)

-- File
vim.keymap.set({ 'n', 'v' }, "<space>w", file.save)

-- Problems / troubles
vim.keymap.set({ 'n', 'v' }, "<space>t", problem.toggle)

-- Editor
vim.keymap.set({ 'n', 'v' }, "H", editor.previous)
vim.keymap.set({ 'n', 'v' }, "L", editor.next)
vim.keymap.set({ 'n', 'v' }, "<space>c", editor.closeActive)
