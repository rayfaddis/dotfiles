-- session manager
return {
  "Shatur/neovim-session-manager",
  -- event = "VeryLazy",
  lazy = false,
  opts = function()
    local config = require("session_manager.config")

    return {
      autoload_mode = config.AutoloadMode.CurrentDir,
      autosave_only_in_session = true,
    }
  end,
}
