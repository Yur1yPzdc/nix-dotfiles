{
  programs.nixvim.plugins.fzf-lua = { 
    enable = true;
    keymaps = {
      "<leader><leader>" = "files";
      "<leader>lg" = "live_grep";
    };
    settings = {
      winopts.backdrop = 85;
      keymap = {
        builtin = {
          "<C-f>" = "preview-page-down";
          "<C-b>" = "preview-page-up";
          "<C-p>" = "toggle-preview";
        };
        fzf = {
          "ctrl-a" = "toggle-all";
          "ctrl-t" = "first";
          "ctrl-g" = "last";
          "ctrl-d" = "half-page-down";
          "ctrl-u" = "half-page-up";
        };
      };
      actions = {
        files = {
          "ctrl-q" = "file_sel_to_qf";
          "ctrl-n" = "toggle_ignore";
          "ctrl-h" = "toggle_hidden";
          "enter" = "file_edit_or_qf";
        };
      };
    };
  };
}
