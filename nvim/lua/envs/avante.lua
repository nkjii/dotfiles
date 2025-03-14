-- 環境変数 AZURE_OPENAI_API_KEY と AZURE_OPENAI_API_KEY_REASONABLE の設定が必要
return {
    opts = {
        provider = "ntj-azure-gpt4o",
        vendors = {
            ["ntj-azure-gpt4o"] = {
                __inherited_from = "azure",
                endpoint = "https://ntj-openai-trial.openai.azure.com",
                deployment = "trial-gpt4o",
                api_version = "2024-04-01-preview",
            },
            ["ntj-azure-o1"] = {
                __inherited_from = "azure",
                -- modelをoから開始する文字列に指定しないと対応できない
                -- https://github.com/yetone/avante.nvim/blob/main/lua/avante/providers/azure.lua#L29
                model = "o1",
                endpoint = "https://ai-front-east-us-2-openai.openai.azure.com",
                deployment = "common_o1_eastus2",
                api_version = "2024-12-01-preview",
                api_key_name = "AZURE_OPENAI_API_KEY_REASONABLE",
            },
            ["ntj-azure-o3-mini"] = {
                __inherited_from = "azure",
                -- modelをoから開始する文字列に指定しないと対応できない
                -- https://github.com/yetone/avante.nvim/blob/main/lua/avante/providers/azure.lua#L29
                model = "o3-mini",
                endpoint = "https://ai-front-east-us-2-openai.openai.azure.com",
                deployment = "common_o3-mini_eastus2",
                api_version = "2024-12-01-preview",
                api_key_name = "AZURE_OPENAI_API_KEY_REASONABLE",
            },
            ["ntj-azure-o3-mini-high"] = {
                __inherited_from = "azure",
                -- modelをoから開始する文字列に指定しないと対応できない
                -- https://github.com/yetone/avante.nvim/blob/main/lua/avante/providers/azure.lua#L29
                model = "o3-mini-high",
                endpoint = "https://ai-front-east-us-2-openai.openai.azure.com",
                deployment = "common_o3-mini_eastus2",
                api_version = "2024-12-01-preview",
                api_key_name = "AZURE_OPENAI_API_KEY_REASONABLE",
                reasoning_effort = "high",
            },
        },
    },
}
