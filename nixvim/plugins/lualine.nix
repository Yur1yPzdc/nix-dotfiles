{
  programs.nixvim.plugins.lualine = {
    enable = true;
    autoLoad = true;
    settings = {
      options = {
        disabled_filetypes = {
          __unkeyed-1 = [
          ];
          __unkeyed-2 = [
          ];
          statusline = [
          ];
          winbar = [
          ];
        };
        globalstatus = true;
      };
      sections = {
        lualine_a = [
          "mode"
        ];
        lualine_b = [
          "branch"
        ];
        lualine_c = [
          "filename"
          "diff"
        ];
        lualine_x = [
          # "diagnostics"
          {
            __unkeyed-1 = {
              __raw = ''
                function()
                    local msg = ""
                    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                    local clients = vim.lsp.get_clients()
                    if next(clients) == nil then
                        return msg
                    end
                    for _, client in ipairs(clients) do
                        local filetypes = client.config.filetypes
                        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                            return client.name
                        end
                    end
                    return msg
                end
              '';
            };
            color = {
              fg = "#787c99";
            };
            icon = "";
          }
          # "encoding"
          # "fileformat"
          "filetype"
        ];
        lualine_y = [
          {
            __unkeyed-1 = "neo-tree";
            colored = true;
            cond = {
              __raw = ''
                function()
                  local buf_size_limit = 1024 * 1024
                  if vim.api.nvim_buf_get_offset(0, vim.api.nvim_buf_line_count(0)) > buf_size_limit then
                    return false
                  end
                
                  return true
                end
              '';
            };
            dense = false;
            dense_sep = ".";
            depth = {
              __raw = "nil";
            };
            sep = " ) ";
          }
        ];
        lualine_z = [
          "location"
        ];
      };
      tabline = {
        lualine_a = [
          {
            __unkeyed-1 = "buffers";
            symbols = {
              alternate_file = "";
            };
          }
        ];
        lualine_z = [
        ];
      };
      winbar = {};
    };
  };
}
