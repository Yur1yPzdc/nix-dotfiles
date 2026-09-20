{
  programs.nixvim.plugins.fzf-lua = { 
    enable = true;
    # lazyLoad.enable = true;
    lazyLoad.enable = false;
    lazyLoad.settings.cmd = "FzfLua";
    # autoload = true;
    profile = "skim";
    keymaps = {
      "<leader><leader>" = "files";
      "<leader>lg" = "live_grep";
      "<leader>ol" = "oldfiles";
      "<leader>bf" = "buffers";
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
    };
  };
}
