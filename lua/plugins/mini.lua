-- Nice quality of life pluggins.
-- Auto-close braces.
-- Comment shortcut.
-- @Review: Whatever surround does, I've not tried yet.
return {
    {
        "echasnovski/mini.pairs",
        event = "InsertEnter",
        version = false, -- Use last version.
        opts = {
            modes = { insert = true, command = false, terminal = false },
            mappings = {
                ["("] = { action = "open", pair = "()", neigh_pattern = "[^\\]." },
                ["["] = { action = "open", pair = "[]", neigh_pattern = "[^\\]." },
                ["{"] = { action = "open", pair = "{}", neigh_pattern = "[^\\]." },

                [")"] = { action = "close", pair = "()", neigh_pattern = "[^\\]." },
                ["]"] = { action = "close", pair = "[]", neigh_pattern = "[^\\]." },
                ["}"] = { action = "close", pair = "{}", neigh_pattern = "[^\\]." },

                ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^\\].", register = { cr = false } },
                ["'"] = { action = "closeopen", pair = "''", neigh_pattern = "[^%w\\].", register = { cr = false } },
                ["`"] = { action = "closeopen", pair = "``", neigh_pattern = "[^\\].", register = { cr = false } },
            },
        },
    },
    {
        "echasnovski/mini.comment",
        version = false,
        opts = {
            mappings = {
                comment = "gc",       -- Comment line in Normal mode, or selection in Visual mode.
                comment_line = "gcc", -- Comment the current line.
                comment_visual = "gc",-- Comment selection in Visual mode.
                textobject = "gc",    -- Textobject for commenting.
            },
        },
    },
    {
        "echasnovski/mini.surround",
        version = false,
        config = function()
            require("mini.surround").setup({
                mappings = {
                    add = "sa",            -- Add surrounding (e.g., saiw").
                    delete = "sd",         -- Delete surrounding (e.g., sd").
                    replace = "sr",        -- Replace surrounding (e.g., sr"{ ).
                    find = "sf",           -- Find right surrounding border.
                    find_left = "sF",      -- Find left surrounding border.
                    highlight = "sh",      -- Highlight surroundings.
                    update_n_lines = "sn", -- Configure how many lines to search.
                },
            })
        end
    },
}
