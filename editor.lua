local editor = {}

function editor.previous()
  vim.fn.VSCodeNotify("workbench.action.previousEditor")
end

function editor.next()
  vim.fn.VSCodeNotify("workbench.action.nextEditor")
end

function editor.closeActive()
  vim.fn.VSCodeNotify("workbench.action.closeActiveEditor")
end

return editor
