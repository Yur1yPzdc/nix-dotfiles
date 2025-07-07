{ config, lib, pkgs, ...}: {

  imports = [
    ./plugins/opts.nix
    # ./keymaps.nix
    # ./autocmds.nix
    ./plugins/bundle.nix
  ];

  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = "-";
    };

    defaultEditor = true;
    colorschemes.tokyonight = {
      enable = true;
      settings = {
        style = "night";
      };
    };

    plugins.nix.enable = true;

    keymaps = let 
      normal = 
       lib.mapAttrsToList
       (key: action: {
         mode = "n";
         inherit action key;
       })
       {
         "<M-c>" = ":Neotree<CR>";
         "<M-v>" = ":Neotree close<CR>";
         # "<M-T>" = ":Telescope find_files<CR>";

         # "<CM-k>" = ":move-2<CR>";
         # "<CM-j>" = ":move+<CR>";
       };
      in
      config.lib.nixvim.keymaps.mkKeymaps
      {options.silent = true;}
      (normal);
    
  };
}
