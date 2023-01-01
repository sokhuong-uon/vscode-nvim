vim.g.mapleader = " "
vim.keymap.set({ 'n' }, "<leader>h", "<cmd>noh<cr>")

--#region whichkey
local whichkey = {
  show = function()
    vim.fn.VSCodeNotify("whichkey.show")
  end
}

vim.keymap.set({ 'n', 'v' }, "<leader>", whichkey.show)
--#endregion whichkey

--#region comment
local comment = {
  selected = function()
    vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
  end
}

vim.keymap.set({ 'n', 'v' }, "<leader>/", comment.selected)
--#endregion comment

--#region file
local file = {
  save = function()
    vim.fn.VSCodeNotify("workbench.action.files.save")
  end,

  saveAll = function()
    vim.fn.VSCodeNotify("workbench.action.files.saveAll")
  end,

  format = function()
    vim.fn.VSCodeNotify("editor.action.formatDocument")
  end,

  showInExplorer = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
  end
}

vim.keymap.set({ 'n', 'v' }, "<space>w", file.save)
vim.keymap.set({ 'n', 'v' }, "<space>wa", file.saveAll)
vim.keymap.set({ 'n' }, "<space>ff", file.format)
vim.keymap.set({ 'n' }, "<space>fe", file.showInExplorer)
--#endregion file

--#region problem
local problem = {
  toggle = function()
    vim.fn.VSCodeNotify("workbench.actions.view.toggleProblems")
  end
}

vim.keymap.set({ 'n', 'v' }, "<space>t", problem.toggle)
--#endregion problem

--#region editor
local editor = {
  previous = function()
    vim.fn.VSCodeNotify("workbench.action.previousEditor")
  end,

  next = function()
    vim.fn.VSCodeNotify("workbench.action.nextEditor")
  end,

  closeActive = function()
    vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
  end,

  closeOther = function()
    vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
  end
}

vim.keymap.set({ 'n', 'v' }, "H", editor.previous)
vim.keymap.set({ 'n', 'v' }, "L", editor.next)
vim.keymap.set({ 'n', 'v' }, "<space>c", editor.closeActive)
vim.keymap.set({ 'n', 'v' }, "<space>k", editor.closeOther)
--#endregion editor

--#region symbol
local symbol = {
  rename = function()
    vim.fn.VSCodeNotify("editor.action.rename")
  end,
}

vim.keymap.set({ 'n' }, "<leader>rr", symbol.rename)
--#endregion symbol

--#region search
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

vim.keymap.set({ 'n' }, "<leader>sr", search.reference)
vim.keymap.set({ 'n' }, "<leader>sR", search.referenceInSideBar)
vim.keymap.set({ 'n' }, "<leader>sp", search.project)
vim.keymap.set({ 'n' }, "<leader>st", search.text)
--#endregion search

--#region project
local project = {
  findFile = function()
    vim.fn.VSCodeNotify("workbench.action.quickOpen")
  end,
  switch = function()
    vim.fn.VSCodeNotify("workbench.action.openRecent")
  end,
  explorer = function()
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end,
}

vim.keymap.set({ 'n' }, "<leader>pf", project.findFile)
vim.keymap.set({ 'n' }, "<leader>pp", project.switch)
vim.keymap.set({ 'n' }, "<leader>pe", project.explorer)
--#endregion project
