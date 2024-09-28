local M = {}

function M.export_to_zed()
	local buffers = vim.api.nvim_list_bufs()
	local file_paths = {}

	for _, buffer in ipairs(buffers) do
		if vim.api.nvim_buf_is_valid(buffer) and vim.bo[buffer].buflisted then
			local file_name = vim.api.nvim_buf_get_name(buffer)

			if file_name ~= "" and vim.fn.filereadable(file_name) == 1 then
				if vim.api.nvim_get_current_buf() == buffer then
					local location = vim.api.nvim_win_get_cursor(0)
					file_name = file_name .. ":" .. location[1] .. ":" .. location[2] + 1
					table.insert(file_paths, 1, file_name)
				else
					table.insert(file_paths, file_name)
				end
			end
		end
	end

	if #file_paths > 0 then
		-- Escape spaces in file paths
		local escaped_paths = vim.tbl_map(function(path)
			return vim.fn.shellescape(path)
		end, file_paths)

		local cwd = vim.fn.getcwd()
		local cmd = "zed " .. vim.fn.shellescape(cwd) .. " " .. table.concat(escaped_paths, " ")

		vim.fn.jobstart(cmd, {
			on_exit = function(_, exit_code)
				if exit_code == 0 then
					print("Opened " .. #file_paths .. " files in Zed")
				else
					print("Failed to open files in Zed")
				end
			end,
		})
	else
		print("No files to open in Zed")
	end
end

function M.setup(opts)
	vim.api.nvim_create_user_command("ExportToZed", function()
		M.export_to_zed()
	end, {})
end

return M
