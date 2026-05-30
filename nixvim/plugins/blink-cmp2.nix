{
  programs.nixvim.plugins.blink-cmp = {
    enable = true;
    # lazyLoad.enable = true;
    settings = {
      signature.enabled = true;
      keymap = {
        preset = "default";
        "<C-space>" = [];
        "<C-p>" = [];
        "<Tab>" = [];
        "<S-Tab>" = [];
        "<C-y>" = [ "show" "show_documentation" "hide_documentation" ];
        "<C-n>" = [ "select_and_accept" "fallback" ];
        "<C-k>" = [ "select_prev" "fallback" ];
        "<C-j>" = [ "select_next" "fallback" ];
        "<C-b>" = [ "scroll_documentation_down" "fallback" ];
        "<C-f>" = [ "scroll_documentation_up" "fallback" ];
        "<C-l>" = [ "snippet_forward" "fallback" ];
        "<C-h>" = [ "snippet_backward" "fallback" ];
      };
      appearance.nerd_font_variant = "mono";
      appearance.use_nvim_cmp_as_default = false;
      completion.documentation = {
        auto_show = true;
        auto_show_delay_ms = 200;
      };
      sources.default = [ "lsp" "path" "snippets" "buffer" ]; 
    };
    luaConfig.post = "
      cmdline = {
        keymap = {
          preset = 'inherit',
          ['<CR>'] = { 'accept_and_enter', 'fallback' },
        },
      },
    ";
  };
}
