local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = {
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-e>"] = cmp.mapping.abort(),

        -- navigate through the completion list
        ["<C-n>"] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ["<C-p>"] = function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,

        -- -- snippet placeholders navigation
        -- ["<Tab>"] = function(fallback)
        --     if luasnip.jumpable(1) then
        --         luasnip.jump(1)
        --     else
        --         fallback()
        --     end
        -- end,
        -- ["<S-Tab>"] = function(fallback)
        --     if luasnip.jumpable(-1) then
        --         luasnip.jump(-1)
        --     else
        --         fallback()
        --     end
        -- end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }),
})

cmp.setup.filetype("markdown", {
    completion = {
        autocomplete = {
            require("cmp.types").cmp.TriggerEvent.InsertEnter,
            require("cmp.types").cmp.TriggerEvent.TextChanged,
        },
        keyword_pattern = [[\k\+]],
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp", option = { keyword_pattern = [[\k\+]] } },
    }),
})

cmp.setup.filetype("supercollider", {
    sources = cmp.config.sources({
        {
            name = "tags",
            option = {
                -- this is the default options, change them if you want.
                -- Delayed time after user input, in milliseconds.
                complete_defer = 100,
                -- Max items when searching `taglist`.
                max_items = 10,
                -- The number of characters that need to be typed to trigger
                -- auto-completion.
                keyword_length = 3,
                -- Use exact word match when searching `taglist`, for better searching
                -- performance.
                exact_match = false,
                -- Prioritize searching result for current buffer.
                current_buffer_only = false,
            },
        },
        { name = "luasnip" },
    }),
})

vim.api.nvim_create_autocmd({ "FileType" }, {
    pattern = { "supercollider" },
    callback = function(_)
        vim.schedule(function()
            require("luasnip").add_snippets(
                "supercollider",
                require("scnvim.utils").get_snippets()
            )
            print("supercollider snippets loaded")
        end)
    end,
    once = true,
})
