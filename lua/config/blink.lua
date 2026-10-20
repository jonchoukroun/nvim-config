require("blink.cmp").setup({
    completion = {
        documentation = { auto_show = true },
        menu = {
            draw = {
                columns = {
                    { "label" },
                    { "kind" },
                    { "source_name" },
                },
            },
        },
    },
})
