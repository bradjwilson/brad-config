vim.g.copilot_filetypes = {xml = false}
--vim.keymap.set.keymap("i", "<C-a>", ":copilot#Accept('\\<CR>')<CR>", { silent =  true })


vim.cmd[[imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")]]

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
