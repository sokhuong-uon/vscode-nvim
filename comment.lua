local comment = {}

function comment.selected()
  vim.fn.VSCodeNotifyRange("editor.action.commentLine", vim.fn.line("v"), vim.fn.line("."), 1)
end

return comment
