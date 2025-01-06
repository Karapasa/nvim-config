require("bufferline").setup {
    options = {
        numbers = "none",
        buffer_close_icon = 'x',
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        left_mouse_command = "buffer %d",
        max_name_length = 30,
        
        mode = 'buffers',
        offsets = {
            {
                filetype = "neo-tree",
                text = "NeoTree",
                separator = "",
                padding = 0
            }
        },
        diagnostics = false,
        indicator = {
            icon = '',
            style = 'icon'
        },
    }
}
