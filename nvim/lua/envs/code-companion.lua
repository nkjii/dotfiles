-- 環境変数 AZURE_OPENAI_API_KEY と AZURE_OPENAI_API_KEY_REASONABLE の設定が必要
return {
    opts = {
        langauge = "Japanese",
        system_prompt = "ずんだもんで回答してください",
        adapters = {
            azure_openai_o1 = function()
                return require("codecompanion.adapters").extend("azure_openai", {
                    formatted_name = "o1",
                    env = {
                        endpoint = "https://ai-front-east-us-2-openai.openai.azure.com/",
                        api_version = "2024-12-01-preview",
                        api_key = "AZURE_OPENAI_API_KEY_REASONABLE",
                    },
                    opts = {
                        stream = false,
                    },
                    schema = {
                        model = {
                            default = "common_o1_eastus2",
                            choices = {
                                ["common_o1_eastus2"] = { opts = { can_reason = true } },
                            },
                        },
                    },
                })
            end,
            azure_openai_o3_mini = function()
                return require("codecompanion.adapters").extend("azure_openai", {
                    formatted_name = "o3-mini",
                    env = {
                        endpoint = "https://ai-front-east-us-2-openai.openai.azure.com/",
                        api_version = "2024-12-01-preview",
                        api_key = "AZURE_OPENAI_API_KEY_REASONABLE",
                    },
                    schema = {
                        model = {
                            default = "common_o3-mini_eastus2",
                            choices = {
                                ["common_o3-mini_eastus2"] = { opts = { can_reason = true } },
                            },
                        },
                    },
                })
            end,
            azure_openai_o3_mini_hight = function()
                return require("codecompanion.adapters").extend("azure_openai", {
                    formatted_name = "o3-mini-high",
                    env = {
                        endpoint = "https://ai-front-east-us-2-openai.openai.azure.com/",
                        api_version = "2024-12-01-preview",
                        api_key = "AZURE_OPENAI_API_KEY_REASONABLE",
                    },
                    schema = {
                        model = {
                            default = "common_o3-mini_eastus2",
                            choices = {
                                ["common_o3-mini_eastus2"] = { opts = { can_reason = true } },
                            },
                        },
                        reasoning_effort = {
                            default = "high",
                        },
                    },
                })
            end,
            azure_openai_4o = function()
                return require("codecompanion.adapters").extend("azure_openai", {
                    formatted_name = "4o",
                    env = {
                        endpoint = "https://ntj-openai-trial.openai.azure.com",
                        api_version = "2024-12-01-preview",
                        api_key = "AZURE_OPENAI_API_KEY",
                    },
                    schema = {
                        model = {
                            default = "trial-gpt4o",
                            choices = {
                                "trial-gpt4o",
                            },
                        },
                    },
                })
            end,
            copilot = function()
                return require("codecompanion.adapters").extend("copilot", {
                    schema = {
                        model = {
                            default = "claude-3.5-sonnet",
                        },
                    },
                })
            end,
        },
        strategies = {
            chat = {
                adapter = "copilot",
            },
            inline = {
                adapter = "copilot",
            },
            -- chat = {
            --     adapter = "azure_openai_4o",
            --     keymaps = {
            --         send = {
            --             modes = { n = "<C-CR>", i = "<C-CR>" }, -- Ctrl+Enter
            --         },
            --     },
            --     roles = {
            --         ---@type string|fun(adapter: CodeCompanion.Adapter): string
            --         llm = function(adapter)
            --             return "CodeCompanion (" .. adapter.formatted_name .. ")"
            --         end,
            --
            --         user = "Me",
            --     },
            -- },
            -- inline = {
            --     adapter = "azure_openai_4o",
            -- },
        },
    },
}
