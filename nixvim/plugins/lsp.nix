{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      settings.indent.enable = true;
    };
 
    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        # Set to false if you have an `updatetime` of ~100.
        clearOnCursorMove = false;
      };
    };
 
    lsp = {
      enable = true;
      inlayHints = true;
 
      servers = {
        rust_analyzer = {
          enable = true;
          autostart = true;
          installRustc = false;
          installCargo = false;
          settings = {
            completition.limit = 8;
            completition.autoimport.enable = true;
            completition.callable.snippets = "fill_arguments";
            typing.autoClosingAngleBrackets.enable = true;
          };
        };
 
        clangd = {
          enable = true;
          autostart = true;
          # filetypes = ["*.c" "*.cpp"];
        };
      };
    };
  };
}
