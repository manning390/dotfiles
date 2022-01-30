require("harpoon").setup({
    global_settings = {
        save_on_change = true,
    },
    projects = {
        ["$HOME/code/cpp/computerGame"] = {
            term = {
                cmds = {
                    "ninja -C $HOME/code/cpp/computerGame/build",
                    "./game"
                }
            }
        }
    }
})
