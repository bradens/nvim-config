return {
  -- lazy.nvim
  "robitx/gp.nvim",
  config = function()
    local conf = {
      -- For customization, refer to Install > Configuration in the Documentation/Readme
      providers = {

        openai = {
          disable = true,
          endpoint = "https://api.openai.com/v1/chat/completions",
          secret = os.getenv("OPENAI_API_KEY"),
        },
        copilot = {
          endpoint = "https://api.githubcopilot.com/chat/completions",
          secret = {
            "bash",
            "-c",
            "cat ~/.config/github-copilot/hosts.json | sed -e 's/.*oauth_token...//;s/\".*//'",
          },
        },
      },
      -- anthropic = {
      --   endpoint = "https://api.anthropic.com/v1/messages",
      --   secret = os.getenv("ANTHROPIC_API_KEY"),
      -- },
    }
    require("gp").setup(conf)
    -- Setup shortcuts here (see Usage > Shortcuts in the Documentation/Readme)
  end,
}
