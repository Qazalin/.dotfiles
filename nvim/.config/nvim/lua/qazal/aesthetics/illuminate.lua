local status, illuminate = pcall(require, 'illuminate')
if not status then
    print('illuminate not installed')
    return
end

illuminate.configure({
    providers = {
        'lsp',
        'treesitter',
        'regex',
    },
    delay = 100,
    filetype_overrides = {},
    filetypes_denylist = {
        'dirvish',
        'fugitive',
    },
    under_cursor = true,
    min_count_to_highlight = 2,
})
