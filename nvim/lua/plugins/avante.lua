return {
    "yetone/avante.nvim",
    keys = {
        -- <Space>aaでエディタのカーソル位置に対して質問したい場合
        {
            "<Space>aa",
            function()
                require("avante").ask()
            end,
        },
        -- <Space>aaでChatの表示/非表示を切り替える場合
        {
            "<Space>at",
            function()
                require("avante").toggle()
            end,
        },
    },
    build = "make",
    dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
    },
    opts = function(_, opts)
        return vim.tbl_deep_extend("force", opts, {
            -- 好みで設定してください
            hints = { enabled = false },
            mappings = {
                ask = "<Space>aa",
                edit = "<Space>ae",
                focus = "<Space>af",
                toggle = {
                    default = "<Space>at",
                },
                sidebar = {
                    switch_windows = "<Space>j",
                    reverse_switch_windows = "<Space>k",
                },
            },
            windows = {
                width = 40,
                ask = {
                    floating = true,
                },
            },
        }, require("envs.avante").opts)
    end,
}
