require('manning390.cmp')
require('manning390.lsp')
require('manning390.telescope')
require('manning390.harpoon')
require('manning390.lualine')
require('manning390.todo')
require('trouble').setup{}

P = function(v)
  print(vim.inspect(v))
  return v
end
