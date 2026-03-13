return {
    "williamboman/mason.nvim",
    opts = {
        ensure_installed = {
            "rust-analyzer",
            "lua-language-server",
        },
    },
    config = function(_, opts)
        require("mason").setup(opts)

        -- Auto-install listed servers if missing
        local mr = require("mason-registry")
        for _, tool in ipairs(opts.ensure_installed or {}) do
            local p = mr.get_package(tool)
            if not p:is_installed() then
                p:install()
            end
        end
    end,
}

