local harpoon_term = require('harpoon.term')
local Worktree = require('git-worktree')

local on_create_commands = {{
    signal_file = 'package-lock.json',
    cmd = 'npm i',
    message = 'NPM detected, running npm install'
},
{
    signal_file = '../../shared/docker-compose.override.yml',
    cmd = 'ln -s ../../shared/docker-compose.override.yml',
    message = 'Docker Override detected, creating symlink',
},
}

Worktree.on_tree_change(function(op, metadata)
  if op == Worktree.Operations.Create then
    vim.fn.execute('cd '..vim.fn.getcwd()..'/'..metadata.path)

    commands_to_run = {}

    for _, command in ipairs(on_create_commands) do
      if vim.fn.filereadable(vim.fn.getcwd()..'/'..metadata.path..'/'..command.signal_file) then
        table.insert(commands_to_run, command.cmd)
      end
    end

    if #commands_to_run > 0 then
      vim.fn.execute('split')
      harpoon_term.gotoTerminal(1)
      harpoon_term.sendCommand(1, table.concat(commands_to_run, ' && ') .. " && exit \n")
      vim.fn.execute('100000') -- Go to the bottom of the buffer so it will auto-scroll
    end
  end
end)

