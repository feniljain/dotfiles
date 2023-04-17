local actions = require('telescope.actions')

local lga_actions = require('telescope-live-grep-args.actions')
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
    filepath = vim.fn.expand(filepath)
    Job:new({
        command = "file",
        args = { "--mime-type", "-b", filepath },
        on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
                previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
                -- maybe we want to write something to the buffer here
                vim.schedule(function()
                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
                end)
            end
        end
    }):sync()
end

require('telescope').setup {
    defaults = {
        preview                = {
            timeout = 500,
            msg_bg_fillchar = "",
            -- hide_on_startup = true -- hide previewer when picker starts
        },
        vimgrep_arguments      = {
            'rg',
            '--color=never',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
            '--hidden',
            "--trim",
        },
        file_sorter            = require('telescope.sorters').get_fzy_sorter,
        layout_config          = {
            prompt_position = 'top',
        },
        prompt_prefix          = "❯ ",
        selection_caret        = "❯ ",
        sorting_strategy       = "ascending",
        color_devicons         = true,
        file_previewer         = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer         = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer       = require('telescope.previewers').vim_buffer_qflist.new,
        mappings               = {
            i = {
                ["<C-x>"] = false,
                ["<esc>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-k>"] = lga_actions.quote_prompt(),
                ['<C-h>'] = require('telescope.actions.layout').toggle_preview, -- Toggle file preview
            },
        },
        buffer_previewer_maker = new_maker,
        -- Show the files in format: <filename> <complete-path>
        path_display = function(_opts, path)
            local tail = require("telescope.utils").path_tail(path)
            return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
        end,
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        },
        live_grep_args = {
            auto_quoting = true,
            mappings = {
                i = {
                    ["<C-k>"] = lga_actions.quote_prompt(),
                }
            }
        },
        heading = {
            treesitter = true,
        },
    },
}

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')
require('telescope').load_extension('project')
require('telescope').load_extension('heading')
-- require('telescope').load_extension('media_files')

local M = {}
M.search_dotfiles = function()
    require("telescope.builtin").find_files({
        prompt_title = "< VimRC >",
        cwd = "$HOME/.config/nvim/",
    })
end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            --- map('i', '<c-d>', actions.git_delete_branch)
            --- map('n', '<c-d>', actions.git_delete_branch)
            return true
        end
    })
end

M.switch_projects = function()
    require("telescope.builtin").find_files({
        prompt_title = "< Switch Project >",
        cwd = "$HOME/Projects/",
    })
end

return M
