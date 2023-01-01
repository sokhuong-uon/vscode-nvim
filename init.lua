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

local problem = {
  toggle = function()
    vim.fn.VSCodeNotify("workbench.actions.view.toggleProblems")
  end
}

local editor = {
  closeActive = function()
    vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
  end,

  closeOther = function()
    vim.fn.VSCodeNotify("workbench.action.closeOtherEditors")
  end
}

local workbench = {
  showCommands = function()
    vim.fn.VSCodeNotify("workbench.action.showCommands")
  end,
  previousEditor = function()
    vim.fn.VSCodeNotify("workbench.action.previousEditor")
  end,
  nextEditor = function()
    vim.fn.VSCodeNotify("workbench.action.nextEditor")
  end,
}

local toggle = {
  toggleActivityBar = function()
    vim.fn.VSCodeNotify("workbench.action.toggleActivityBarVisibility")
  end,
  toggleSideBarVisibility = function()
    vim.fn.VSCodeNotify("workbench.action.toggleSidebarVisibility")
  end,
  toggleZenMode = function()
    vim.fn.VSCodeNotify("workbench.action.toggleZenMode")
  end,
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

local project = {
  findFile = function()
    vim.fn.VSCodeNotify("workbench.action.quickOpen")
  end,
  switch = function()
    vim.fn.VSCodeNotify("workbench.action.openRecent")
  end,
  tree = function()
    vim.fn.VSCodeNotify("workbench.view.explorer")
  end,
}

local git = {
  init = function()
    vim.fn.VSCodeNotify("git.init")
  end,
  switch = function()
    vim.fn.VSCodeNotify("git.checkout")
  end,
  push = function()
    vim.fn.VSCodeNotify("git.push")
  end,
  pull = function()
    vim.fn.VSCodeNotify("git.pull")
  end,
  publish = function()
    vim.fn.VSCodeNotify("git.publish")
  end,

  -- if gitlens installed
  graph = function()
    vim.fn.VSCodeNotify("gitlens.showGraphPage")
  end,
}

--#region keymap
vim.g.mapleader = " "

vim.keymap.set({ 'n' }, "<leader>h", "<cmd>noh<cr>")
vim.keymap.set({ 'n', 'v' }, "<leader>", whichkey.show)
vim.keymap.set({ 'n', 'v' }, "<leader>/", comment.selected)

vim.keymap.set({ 'n', 'v' }, "<leader> ", workbench.showCommands)

vim.keymap.set({ 'n', 'v' }, "H", workbench.previousEditor)
vim.keymap.set({ 'n', 'v' }, "L", workbench.nextEditor)

vim.keymap.set({ 'n' }, "<leader>gs", git.switch)
vim.keymap.set({ 'n' }, "<leader>gi", git.init)
vim.keymap.set({ 'n' }, "<leader>gp", git.push)
vim.keymap.set({ 'n' }, "<leader>gP", git.pull)
vim.keymap.set({ 'n' }, "<leader>gU", git.publish)
vim.keymap.set({ 'n' }, "<leader>gg", git.graph)

vim.keymap.set({ 'n' }, "<leader>pf", project.findFile)
vim.keymap.set({ 'n' }, "<leader>pp", project.switch)
vim.keymap.set({ 'n' }, "<leader>pt", project.tree)

vim.keymap.set({ 'n', 'v' }, "<space>w", file.save)
vim.keymap.set({ 'n', 'v' }, "<space>wa", file.saveAll)
vim.keymap.set({ 'n' }, "<space>ff", file.format)
vim.keymap.set({ 'n' }, "<space>ft", file.showInExplorer)

vim.keymap.set({ 'n', 'v' }, "<space>c", editor.closeActive)
vim.keymap.set({ 'n', 'v' }, "<space>k", editor.closeOther)

vim.keymap.set({ 'n', 'v' }, "<space>e", problem.toggle)

vim.keymap.set({ 'n', 'v' }, "<leader>ta", toggle.toggleActivityBar)
vim.keymap.set({ 'n', 'v' }, "<leader>tz", toggle.toggleZenMode)
vim.keymap.set({ 'n', 'v' }, "<leader>ts", toggle.toggleSideBarVisibility)

vim.keymap.set({ 'n' }, "<leader>rr", symbol.rename)

vim.keymap.set({ 'n' }, "<leader>sr", search.reference)
vim.keymap.set({ 'n' }, "<leader>sR", search.referenceInSideBar)
vim.keymap.set({ 'n' }, "<leader>sp", search.project)
vim.keymap.set({ 'n' }, "<leader>st", search.text)
--#endregion keymap
