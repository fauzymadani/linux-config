return {
  "echasnovski/mini.starter",
  version = false,
  config = function()
    local starter = require("mini.starter")

    starter.setup({
      evaluate_single = true,
      header = [[
              ,----------------,              ,---------,
        ,-----------------------,          ,"        ,"|
      ,"                      ,"|        ,"        ,"  |
     +-----------------------+  |      ,"        ,"    |
     |  .-----------------.  |  |     +---------+      |
     |  |                 |  |  |     | -==----'|      |
     |  |  I LOVE LINUX!  |  |  |     |         |      |
     |  |  Bad command or |  |  |/----|`---=    |      |
     |  |  C:\>_sudo su   |  |  |   ,/|==== ooo |      ;
     |  |                 |  |  |  // |(((( [33]|    ,"
     |  `-----------------'  |," .;'| |((((     |  ,"
     +-----------------------+  ;;  | |         |,"     -[fauzy@debian]-
        /_)______________(_/  //'   | +---------+
   ___________________________/___  `,
  /  oooooooooooooooo  .o.  oooo /,   \,"-----------
 / ==ooooooooooooooo==.o.  ooo= //   ,`\--{)B     ,"
/_==__==========__==_ooo__ooo=_/'   /___________,"
`-----------------------------' 
      ]],
      items = {
        -- Builtin actions
        { name = "Edit new buffer 󰏌 ", action = "enew", section = "Builtin" },
        { name = "Quit Neovim ⏻ ", action = "qa", section = "Builtin" },

        -- Telescope actions
        { name = "Find file 󰈞 ", action = "Telescope find_files", section = "Telescope" },
        { name = "Find word  ", action = "Telescope live_grep", section = "Telescope" },
        { name = "Recent files  ", action = "Telescope oldfiles", section = "Telescope" },
        { name = "Config  ", action = "edit $MYVIMRC", section = "Telescope" },
        { name = "Restore sessions  ", action = "Telescope sessions_picker", section = "Telescope" },
        { name = "TodoTelescope  ", action = "Telescope todo-comments todo", section = "Telescope" },

        -- Sessions
        { name = "mvim session", action = "SessionLoad mvim", section = "Sessions" },
        { name = "ansible session", action = "SessionLoad ansible", section = "Sessions" },
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.aligning("center", "center"),
      },
    })
  end,
}
