-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
        default_component_configs = {
            icon = {
                folder_closed = "[+]",
                folder_open = "[-]",
                folder_empty = "[ ]",
                default = "•",
            },
        },
    },
    config = function()
        local neotree = require("neo-tree")
        neotree.setup({
            filesystem = {
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    never_show = { ".DS_Store", "thumbs.db" },
                },
                follow_current_file = true,
                use_libuv_file_watcher = true,
            },
        })

        -- vim.api.nvim_set_hl(0, 'NeoTreeLine', { bg = 'none' })
        -- vim.keymap.set("n", "<C-b>", ":Neotree toggle reveal=true position=left<CR>", {})
        -- normal, insert, visual, visual block
        vim.keymap.set(
            { "n", "i", "v", "x" },
            "<leader>e",
            "<Esc>:Neotree toggle position=left<CR>",
            { noremap = true, silent = true }
        )

        -- terminal mode
        vim.keymap.set("t", "<leader>e", "<C-\\><C-n>:Neotree toggle position=left<CR>", { noremap = true, silent = true })
    end,
}
