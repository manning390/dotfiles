require'manning390.set'
require'manning390.packer'
require'manning390.remaps'
require'manning390.commands'
require'manning390.autocmd'
require'manning390.telescope'

-- local project level settings
local ok, _ = pcall(dofile, './.nvim/init.lua')
-- if ok then
--     print('local settings loaded')
-- end
