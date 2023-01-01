local file = {}

function file.save()
  vim.fn.VSCodeNotify("workbench.action.files.save")
end

return file
