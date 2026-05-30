{ config, lib, ...}: {

  imports = [
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

    keymaps = let 
      normal = 
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "<M-c>"        = ":Neotree<CR>";
          "<M-v>"        = ":Neotree close<CR>";
          "<M-a>"        = ":AerialToggle<CR>";
          "<leader>cc"   = ":!cargo check<CR>";
        };
      in
      config.lib.nixvim.keymaps.mkKeymaps
      {options.silent = true;}
      (normal);
    
  };
}
