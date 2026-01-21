{
  programs.nixvim.plugins = {
    treesitter = {
      enable = true;
      nixvimInjections = true;
      settings.indent.enable = true;
    };
 
    # treesitter-refactor = {
    #   enable = true;
    #   highlightDefinitions = {
    #     enable = true;
    #     clearOnCursorMove = false;
    #   };
    # };
 
    lsp = {
      enable = true;
      inlayHints = true;
 
      servers = {
        rust_analyzer = {
          enable = true;
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
          settings = {
            filetypes = [ "c" "cpp" ];
            root_markers = [ "compile_commands.json" "compile_flags.txt" ];
          };
        };

        nixd = {
          enable = true;
        };

        nil_ls = {
          enable = false;
        };

        slint_lsp = {
          enable = true;
          settings.filetypes = [ "slint" ];
        };
      };
    };
  };
}
