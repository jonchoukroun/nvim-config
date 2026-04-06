return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.x",
    opts = {
        completion = {
            documentation = { auto_show = true },
            menu = {
                draw = {
                    columns = {
                        { "label" },
                        { "kind" },
                        { "source_name" }
                    }
                }
            }
        },
    }
}
