require("nvim-tree").setup({
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    filters = {
        dotfiles = true,
    },
    renderer = {
        group_empty = true
    }
})
