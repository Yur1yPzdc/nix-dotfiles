{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = "find_files --cwd=~";
      "<leader>b" = "buffers";
      "<leader>fh" = "help_tags";
      "<leader>gf" = "git_files";
      "<leader>l" = "oldfiles";
      "<leader>ii" = "live_grep";
      # "<leader>fd" = "diagnostics";
    };



    settings.defaults = {
      layout_config.prompt_position = "top";
      selection_caret = "> ";
      #themes.get_ivy = true;
      layout_strategy = "vertical";
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
        "%.ipynb"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };
}
