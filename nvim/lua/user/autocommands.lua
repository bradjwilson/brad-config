-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"


function sleep(n)
  local t = os.clock()
  while os.clock() - t <= n do
    -- nothing
  end
end

function set_pps(target)
  -- vim.cmd 'Hi/Find -F #include "forest_controls.h"'

  local file = io.open("cmake_pp.json", "r")
  if not file then return nil end
  local jsonString = file:read "*a"
  file:close()

  local json = require 'lunajson'
  local t = json.decode(jsonString)
  local items_c = #t["26w_CC_Driver"]




  pcall(vim.cmd, 'sml#mode_on')
  for i = 1, items_c do
    --TODO 
    -- 0. Get current file name 
    -- 1. Get Current cursur location
    -- 2. Move to top line with gg
    -- 3. Enter sml#mode_on
    -- 4. Move to start location 

    pcall(vim.cmd, 't[target][i]["start"]')
    pcall(vim.cmd, 'norm v')
    sleep(.1)

    -- pcall(vim.cmd, "Hi " .. "+ " .. "BRHYTHM_APP_DEF(rhythm_app, APP_CONFIG_FORCE_SEGMENTATION, APP_CONFIG_MIC_SIZE, ADH_RHYTHM_ENTRY);\n")
    --pcall(vim.cmd, 't[target][i]["start"], t[target][i]["end"] ')
    --print(vim.inspect(t[target][i]["code"]))
  end
end



-- Fixes Autocomment
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=cro"
    -- set_pps("26w_CC_Driver")
  end,
})

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})
