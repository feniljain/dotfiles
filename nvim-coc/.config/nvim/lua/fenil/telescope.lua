local actions = require('telescope.actions')
require('telescope').setup {
    defaults = {
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden'
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        prompt_prefix = ' > ',
        layout_config = {
            prompt_position = 'bottom',
        },
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<esc>"] = actions.close,
                ["<C-q>"] = actions.send_to_qflist,
                ["<C-s>"] = actions.file_split,
            },
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true,
        }
    }
}

require("telescope").load_extension("git_worktree")
require('telescope').load_extension('fzy_native')
-- require('telescope').load_extension('project')
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
    require("telescope.builtin").find_files ({
        prompt_title = "< Switch Project >",
        cwd = "$HOME/Projects/",
    })
end

return M
