{
  programs.nixvim.plugins.cmp = {
    enable = true;
    autoEnableSources = true;
    settings = {
      sources = [
        {
          name = "nvim_lsp";
        }
        {
          name = "luasnip";
        }
      ];

      mapping = {
        "<Tab>" = "cmp.mapping.confirm({ select = true })";
        "<S-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        "<C-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
      };

      snippet.expand = ''
        function(args) require('luasnip').lsp_expand(args.body) end
      '';
    };
  };
}
