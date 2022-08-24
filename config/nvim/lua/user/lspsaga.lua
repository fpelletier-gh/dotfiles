local status_ok, lspsaga = pcall(require, "lspsaga")
if not status_ok then
	return
end

lspsaga.setup({
	rename_output_qflist = {
		enable = true,
		auto_open_qflist = true,
	},
})

vim.cmd([[
  nnoremap <silent> ]d :Lspsaga diagnostic_jump_next<CR>
  nnoremap <silent> [d :Lspsaga diagnostic_jump_prev<CR>
  nnoremap <silent> gs :Lspsaga signature_help<CR>
  nnoremap <silent>K :Lspsaga hover_doc<CR>
  nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
  nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
]])

vim.cmd([[
  augroup lspsaga_filetypes
    autocmd!
    autocmd FileType LspsagaHover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  augroup END
]])
