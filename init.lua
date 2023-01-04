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
  end,

  rename = function()
    vim.fn.VSCodeNotify("workbench.files.action.showActiveFileInExplorer")
    vim.fn.VSCodeNotify("renameFile")
  end
}

local error = {
  list = function()
    vim.fn.VSCodeNotify("workbench.actions.view.problems")
  end,
  next = function()
    vim.fn.VSCodeNotify("editor.action.marker.next")
  end,
  previous = function()
    vim.fn.VSCodeNotify("editor.action.marker.prev")
  end,
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
  theme = function()
    vim.fn.VSCodeNotify("workbench.action.selectTheme")
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
  status = function()
    vim.fn.VSCodeNotify("workbench.view.scm")
  end,
  switch = function()
    vim.fn.VSCodeNotify("git.checkout")
  end,
  deleteBranch = function()
    vim.fn.VSCodeNotify("git.deleteBranch")
  end,
  push = function()
    vim.fn.VSCodeNotify("git.push")
  end,
  pull = function()
    vim.fn.VSCodeNotify("git.pull")
  end,
  fetch = function()
    vim.fn.VSCodeNotify("git.fetch")
  end,
  commit = function()
    vim.fn.VSCodeNotify("git.commit")
  end,
  publish = function()
    vim.fn.VSCodeNotify("git.publish")
  end,

  -- if gitlens installed
  graph = function()
    vim.fn.VSCodeNotify("gitlens.showGraphPage")
  end,
}

local fold = {
  toggle = function()
    vim.fn.VSCodeNotify("editor.toggleFold")
  end,

  all = function()
    vim.fn.VSCodeNotify("editor.foldAll")
  end,
  openAll = function()
    vim.fn.VSCodeNotify("editor.unfoldAll")
  end,

  close = function()
    vim.fn.VSCodeNotify("editor.fold")
  end,
  open = function()
    vim.fn.VSCodeNotify("editor.unfold")
  end,
  openRecursive = function()
    vim.fn.VSCodeNotify("editor.unfoldRecursively")
  end,

  blockComment = function()
    vim.fn.VSCodeNotify("editor.foldAllBlockComments")
  end,

  allMarkerRegion = function()
    vim.fn.VSCodeNotify("editor.foldAllMarkerRegions")
  end,
  openAllMarkerRegion = function()
    vim.fn.VSCodeNotify("editor.unfoldAllMarkerRegions")
  end,
}

local vscode = {
  focusEditor = function()
    vim.fn.VSCodeNotify("workbench.action.focusActiveEditorGroup")
  end,
  moveSideBarRight = function()
    vim.fn.VSCodeNotify("workbench.action.moveSideBarRight")
  end,
  moveSideBarLeft = function()
    vim.fn.VSCodeNotify("workbench.action.moveSideBarLeft")
  end,
}

-- https://vi.stackexchange.com/a/31887
local n_keymap = function(lhs, rhs)
  vim.api.nvim_set_keymap('n', lhs, rhs, { noremap = true, silent = true })
  vim.api.nvim_set_keymap('v', lhs, rhs, { noremap = true, silent = true })
end

--#region keymap
vim.g.mapleader = " "

n_keymap('s', '}')
n_keymap('S', '{')

vim.keymap.set({ 'n' }, "<leader>h", "<cmd>noh<cr>")
vim.keymap.set({ 'n', 'v' }, "<leader>", whichkey.show)
vim.keymap.set({ 'n', 'v' }, "<leader>/", comment.selected)

vim.keymap.set({ 'n', 'v' }, "<leader> ", workbench.showCommands)

vim.keymap.set({ 'n', 'v' }, "H", workbench.previousEditor)
vim.keymap.set({ 'n', 'v' }, "L", workbench.nextEditor)

vim.keymap.set({ 'n' }, "<leader>el", error.list)
vim.keymap.set({ 'n' }, "<leader>en", error.next)
vim.keymap.set({ 'n' }, "<leader>ep", error.previous)

vim.keymap.set({ 'n' }, "<leader>gb", git.switch)
vim.keymap.set({ 'n' }, "<leader>gi", git.init)
vim.keymap.set({ 'n' }, "<leader>gd", git.deleteBranch)
vim.keymap.set({ 'n' }, "<leader>gf", git.fetch)
vim.keymap.set({ 'n' }, "<leader>gs", git.status)
vim.keymap.set({ 'n' }, "<leader>gp", git.pull)
vim.keymap.set({ 'n' }, "<leader>gg", git.graph)

vim.keymap.set({ 'n' }, "<leader>pf", project.findFile)
vim.keymap.set({ 'n' }, "<leader>pp", project.switch)
vim.keymap.set({ 'n' }, "<leader>pt", project.tree)

vim.keymap.set({ 'n', 'v' }, "<space>w", file.save)
vim.keymap.set({ 'n', 'v' }, "<space>wa", file.saveAll)
vim.keymap.set({ 'n', 'v' }, "<space>fs", file.save)
vim.keymap.set({ 'n', 'v' }, "<space>fS", file.saveAll)
vim.keymap.set({ 'n' }, "<space>ff", file.format)
vim.keymap.set({ 'n' }, "<space>ft", file.showInExplorer)
vim.keymap.set({ 'n' }, "<space>fr", file.rename)

vim.keymap.set({ 'n', 'v' }, "<space>c", editor.closeActive)
vim.keymap.set({ 'n', 'v' }, "<space>bc", editor.closeActive)
vim.keymap.set({ 'n', 'v' }, "<space>k", editor.closeOther)
vim.keymap.set({ 'n', 'v' }, "<space>bk", editor.closeOther)

vim.keymap.set({ 'n', 'v' }, "<leader>ta", toggle.toggleActivityBar)
vim.keymap.set({ 'n', 'v' }, "<leader>tz", toggle.toggleZenMode)
vim.keymap.set({ 'n', 'v' }, "<leader>ts", toggle.toggleSideBarVisibility)
vim.keymap.set({ 'n', 'v' }, "<leader>tt", toggle.theme)

vim.keymap.set({ 'n' }, "<leader>rr", symbol.rename)

vim.keymap.set({ 'n' }, "<leader>sr", search.reference)
vim.keymap.set({ 'n' }, "<leader>sR", search.referenceInSideBar)
vim.keymap.set({ 'n' }, "<leader>sp", search.project)
vim.keymap.set({ 'n' }, "<leader>st", search.text)

vim.keymap.set({ 'n' }, "<leader>ve", vscode.focusEditor)
vim.keymap.set({ 'n' }, "<leader>vl", vscode.moveSideBarLeft)
vim.keymap.set({ 'n' }, "<leader>vr", vscode.moveSideBarRight)

vim.keymap.set({ 'n' }, "<leader>zr", fold.openAll)
vim.keymap.set({ 'n' }, "<leader>zO", fold.openRecursive)
vim.keymap.set({ 'n' }, "<leader>zo", fold.open)
vim.keymap.set({ 'n' }, "<leader>zm", fold.all)
vim.keymap.set({ 'n' }, "<leader>zb", fold.blockComment)
vim.keymap.set({ 'n' }, "<leader>zc", fold.close)
vim.keymap.set({ 'n' }, "<leader>zg", fold.allMarkerRegion)
vim.keymap.set({ 'n' }, "<leader>zG", fold.openAllMarkerRegion)
vim.keymap.set({ 'n' }, "<leader>za", fold.toggle)
--#endregion keymap
