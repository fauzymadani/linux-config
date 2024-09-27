return {
  "echasnovski/mini.starter",
  version = false,
  event = "VimEnter",
  opts = function()
    local logo = table.concat({
      "            ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z",
      "            ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    ",
      "            ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       ",
      "            ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         ",
      "            ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           ",
      "            ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝ BTW :>    ",
      "                    H a p p y  C o d i n g,  F a u z y!                        ",
    }, "\n")
    local pad = string.rep(" ", 10) -- Adjust padding to your preference
    local new_section = function(name, action, section)
      return { name = name, action = action, section = section }
    end

    local starter = require("mini.starter")
    local config = {
      evaluate_single = true,
      header = logo,
      items = {
        new_section(" ..........Find file", LazyVim.pick(), "Actions"),
        new_section("  New file", "ene | startinsert", "Actions"),
        new_section("  Recent files", LazyVim.pick("oldfiles"), "Actions"),
        new_section("  Find text", LazyVim.pick("live_grep"), "Actions"),
        new_section("  Config", LazyVim.pick.config_files(), "Actions"),
        new_section("  Restore session", [[lua require("persistence").load()]], "Session"),
        new_section("  Lazy Extras", "LazyExtras", "Config"),
        new_section("鈴 Lazy", "Lazy", "Config"),
        new_section("  Quit", "qa", "Actions"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "", false), -- Adjust bullet or padding
        starter.gen_hook.aligning("center", "center"),
      },
    }
    return config
  end,
  config = function(_, config)
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniStarterOpened",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    local starter = require("mini.starter")
    starter.setup(config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function(ev)
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(" ", 8)
        starter.config.footer = pad_footer .. "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        if vim.bo[ev.buf].filetype == "ministarter" then
          pcall(starter.refresh)
        end
      end,
    })
  end,
}
