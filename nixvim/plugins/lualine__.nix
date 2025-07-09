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
            "neo-tree"
            "Telescope"
          ];
          statusline = [
          ];
          tabline = [
            "neo-tree"
            "[No Name]"
            "unnamed"
          ];
          winbar = [
            "neo-tree"
          ];
        };
        globalstatus = true;
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "";
          right = "";
        };
        theme.normal.c = {
          bg = "#1a1b26";
          fg = "#698bd3";
        };
        theme.inactive.c = {
          bg = "#1a1b26";
          fg = "#698bd3";
        };
        theme.normal.a = {
          bg = "#698bd3";
          fg = "#1a1b26";
        };
        theme.inactive.a = {
          bg = "#1a1b26";
          fg = "#698bd3";
        };
      };
      sections = {
        lualine_a = [
          ""
        ];
        lualine_b = [
          ""
        ];
        lualine_c = [
          {
            __unkeyed-1 = {
              __raw = 
              ''
                function()
                  return ''
                end,
                color = function()
                  local mode_color = {
                    n = '#ec5f67',
                    i = '#98be65',
                    v = '#51afef',
                    [''] = '#51afef',
                    V = '#51afef',
                    c = '#c678dd',
                    no = '#ec5f67',
                    s = '#FF8800',
                    S = '#FF8800',
                    [''] = '#FF8800',
                    ic = '#ecbe7b',
                    R = '#a9a1e1',
                    Rv = '#a9a1e1',
                    cv = '#ec5f67',
                    ce = '#ec5f67',
                    r = '#008080',
                    rm = '#008080',
                    ['r?'] = '#008080',
                    ['!'] = '#ec5f67',
                    t = '#ec5f67',
                  }
                  return { fg = mode_color[vim.fn.mode()], bg = '#1a1b26', }
                end
              '';
            };
          }
          {
            __unkeyed-1 = {
              __raw = 
              ''
                'mode',
                color = function()
                  local mode_color = {
                    n = '#ec5f67',
                    i = '#98be65',
                    v = '#51afef',
                    [''] = '#51afef',
                    V = '#51afef',
                    c = '#c678dd',
                    no = '#ec5f67',
                    s = '#FF8800',
                    S = '#FF8800',
                    [''] = '#FF8800',
                    ic = '#ecbe7b',
                    R = '#a9a1e1',
                    Rv = '#a9a1e1',
                    cv = '#ec5f67',
                    ce = '#ec5f67',
                    r = '#008080',
                    rm = '#008080',
                    ['r?'] = '#008080',
                    ['!'] = '#ec5f67',
                    t = '#ec5f67',
                  }
                  return { fg = mode_color[vim.fn.mode()], bg = '#1a1b26', gui = 'bold' }
                end
              '';
            };
          }
          {
            __unkeyed-2 = "filesize";
            color.fg = "#bbc2cf";
            color.bg = "#1a1b26";
            color.gui = "bold";
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 80
              end
            '';
          }
          {
            __unkeyed-2 = "filename";
            color.fg = "#c568dd";
            color.bg = "#1a1b26";
            color.gui = "bold";
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 100
              end
            '';
          }
          {
            __unkeyed-2 = "location";
            color.fg = "#bbc2cf";
            color.bg = "#1a1b26";
            color.gui = "bold";
          }
          {
            __unkeyed-2 = "progress";
            color.fg = "#bbc2cf";
            color.bg = "#1a1b26";
            color.gui = "bold";
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 80
              end
            '';
          }
        ];
        lualine_x = [
          {
            __unkeyed-1 = {
              __raw = 
              ''
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
              fg = "#bbc2cf";
              bg = "#1a1b26";
              gui = "bold";
            };
            icon = " LSP: ";
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 80
              end
            '';
          }
          "%="
          {
            __unkeyed-1 = "encoding";
            color.fg = "#98be65";
            color.bg = "#1a1b26";
            color.gui = "bold";
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 80
              end
            '';
          }
          {
            __unkeyed-1 = "fileformat";
            color.fg = "#98be65";
            color.bg = "#1a1b26";
            color.gui = "bold";
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 80
              end
            '';
          }
          {
            __unkeyed-1 = "branch";
            color.fg = "#a9a1e1";
            color.bg = "#1a1b26";
            color.gui = "bold";
            fmt.__raw = 
            ''
              function(branch_name)
                local max_length = 10
                if #branch_name > max_length and vim.fn.winwidth(0) < 61 then
                  return string.sub(branch_name, 1, max_length) .. '…'
                end
                return branch_name
              end
            '';
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 60            
              end
            '';
            icon = " ";
          }
          {
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = "󰝤 ";
              removed = " ";
            };
            diff_color = {
              added.fg = "#98be65";
              modified.fg = "#ff8800";
              removed.fg = "#ec5f67";
            };
            color.bg = "#1a1b26";
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 60
              end
            '';
          }
          # {
          #   __unkeyed-1 = {
          #     __raw = 
          #     ''
          #       function()
          #         return '▊'
          #       end
          #     '';
          #   };
          #   color.fg = "#51afef";
          #   color.bg = "#1a1b26";
          #   padding.right = 0;
          # }
          {
            __unkeyed-1 = "diagnostics";
            cond.__raw = 
            ''
              function()
                return vim.fn.winwidth(0) > 100
              end
            '';
          }
        ];
        lualine_y = [
          ""
        ];
        lualine_z = [
          ""
        ];
      };
      tabline = {
        lualine_a = [
          {
            __unkeyed-1 = "buffers";
            symbols.alternate_file = ""; 
          }
        ];
      };
      winbar = {};
    };
  };
}
