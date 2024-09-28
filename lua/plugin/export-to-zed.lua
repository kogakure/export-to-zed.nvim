if vim.fn.has("nvim-0.7.0") == 0 then
	vim.api.nvim_err_writeln("export-to-zed requires at least nvim-0.7.0")
	return
end

if vim.g.loaded_export_to_zed == 1 then
	return
end
vim.g.loaded_export_to_zed = 1

require("export-to-zed").setup()
