local problem = {}

function problem.toggle()
  vim.fn.VSCodeNotify("workbench.actions.view.toggleProblems")
end

return problem
