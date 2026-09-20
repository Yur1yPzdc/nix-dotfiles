{ config, lib, ...}: {

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
    };

    defaultEditor = true;

    keymaps = let 
      normal = lib.mapAttrsToList (
        key: action: {
          mode = "n";
          inherit action key;
        }) {
        # this is key      this is action
          "<leader>e" = "<Cmd>Explore<CR>";
          "gd" = "<Cmd>lua vim.lsp.buf.definition()<CR>";
        };
      in
      config.lib.nixvim.keymaps.mkKeymaps
        {options.silent = true;}
        (normal);
  };

  programs.nixvim.plugins.lz-n.enable = true;

  imports = [
    ./plugins/bundle2.nix
  ];
}
