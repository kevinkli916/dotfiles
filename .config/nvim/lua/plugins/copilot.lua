return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Optional: Configure keybindings or other settings
      vim.g.copilot_no_tab_map = true
      vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { expr = true, silent = true })
    end
  }
}
