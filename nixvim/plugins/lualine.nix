let 
  tabsss = 
  ''
function()
  local result = {}
  
  for i = 1, vim.fn.tabpagenr("$") do
    local buflist = vim.fn.tabpagebuflist(i)
    local winnr = vim.fn.tabpagewinnr(i)
    local bufnr = buflist[winnr]
    local bufname = vim.fn.bufname(bufnr)
    
    -- Get filename
    local filename = vim.fn.fnamemodify(bufname, ":t")
    filename = filename == "" and "[No Name]" or filename
    local extension = vim.fn.fnamemodify(filename, ":e")
    local icon = require'nvim-web-devicons'.get_icon(filename, extension)
    icon = icon == nil and "" or icon
    
    -- Check modified
    local modified = ""
    for _, b in ipairs(buflist) do
      if vim.api.nvim_buf_get_option(b, "modified") then
        modified = "[+]"
        break
      end
    end
    
    -- Window count
    local window_count = #buflist
    local is_active = i == vim.fn.tabpagenr()
    local is_larger = i > vim.fn.tabpagenr()
    local is_smaller_special = i < vim.fn.tabpagenr() - 1
    
    -- Build clickable tab
    local tab_content = string.format("%d:%s %s %s(%d) ", i, icon, filename, modified, window_count)
    local clickable_tab = string.format("%%%dT%s%%T", i, tab_content)
    
    if is_active then
      table.insert(result, "%#CTabA#" .. clickable_tab .. "%#CTabI#%#TabLine#")
    else
      if is_larger or is_smaller_special then
        table.insert(result, "%#CTabI#" .. clickable_tab .. "%#CTabI#%#TabLineFill#")
      else
        table.insert(result, "%#CTabI#" .. clickable_tab .. "%#CTabA#%#TabLineFill#")
      end
    end
  end
  
  -- Fill the rest
  table.insert(result, "%#TabLineFill#%T%=")
  
  return table.concat(result, "")
end 
    '';
  cond_50 = 
  ''
    function()
    return vim.fn.winwidth(0) > 50
    end
  '';
  cond_80 = 
  ''
    function()
    return vim.fn.winwidth(0) > 80
    end
  '';
  cond_100 = 
  ''
    function()
    return vim.fn.winwidth(0) > 100
    end
  '';

in
{
  programs.nixvim.plugins.lualine = {
    enable = true;
    autoLoad = true;
    settings = {
      options = {
        # Where to not appear
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
          bg = "#15161e";
          fg = "#698bd3";
        };
        theme.inactive.c = {
          bg = "#15161e";
          fg = "#698bd3";
        };
        theme.normal.a = {
          bg = "#698bd3";
          fg = "#15161e";
        };
        theme.inactive.a = {
          bg = "#15161e";
          fg = "#698bd3";
        };
      };

      sections = {
        # Empty for better positioning
        lualine_a = [
          ""
        ];
        lualine_b = [
          ""
        ];

        lualine_c = [
          
          { # Vim mode
            __unkeyed-1 = {
              __raw = 
              ''
                'mode',
                color = function()
                  local mode_color = {
                    n = '#ec5f67',      -- NORMAL 
                    i = '#98be65',      -- INSERT 
                    v = '#51afef',      -- VISUAL 
                    [''] = '#51afef', -- VISUAL BLOCK
                    V = '#51afef',      -- VISUAL LINE 
                    c = '#c678dd',      -- COMMAND 
                    no = '#ec5f67',     -- WAITING OPERATOR 
                    s = '#FF8800',      -- SELECT 
                    S = '#FF8800',      -- SELECT LINE 
                    [''] = '#FF8800', -- SELECT BLOCK 
                    ic = '#ecbe7b',     --  
                    R = '#a9a1e1',      -- REPLACE 
                    Rv = '#a9a1e1',     -- VIRTUAL REPLACE 
                    cv = '#ec5f67',     --  
                    ce = '#ec5f67',     --  
                    r = '#008080',      --  
                    rm = '#008080',     --  
                    ['r?'] = '#008080', --  
                    ['!'] = '#ec5f67',  -- EXTERNAL !command
                    t = '#ec5f67',      -- TERMINAL 
                  }
                  return { fg = mode_color[vim.fn.mode()], bg = '#15161e', gui = 'bold' }
                end
              '';
            };
            icon = "";
          }
          
          { # Filesize
            __unkeyed-2 = "filesize";
            color.fg = "#bbc2cf";
            color.bg = "#15161e";
            color.gui = "bold";
            cond.__raw = cond_80;
          }
          
          { # Location
            __unkeyed-2 = "location";
            color.fg = "#bbc2cf";
            color.bg = "#15161e";
            color.gui = "bold";
          }
          
          { # Progress
            __unkeyed-2 = "progress";
            color.fg = "#bbc2cf";
            color.bg = "#15161e";
            color.gui = "bold";
            cond.__raw = cond_80;
          }
        ];
        lualine_x = [
          
          { # Working LSP
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
              bg = "#15161e";
              gui = "bold";
            };
            icon = " LSP: ";
            cond.__raw = cond_80;
          }
          # Offset for better positioning
          "%="
          
          { # Git branchname
            __unkeyed-1 = "branch";
            color.fg = "#a9a1e1";
            color.bg = "#15161e";
            color.gui = "bold";
            fmt.__raw = 
            ''
                function(str)
                  local max_length = 15
                  return #str > max_length and str:sub(1, max_length - 1) .. "…" or str
                end
            '';
            cond.__raw = cond_50;
            icon = "";
          }
          
          { # Difference
            __unkeyed-1 = "diff";
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
            diff_color = {
              modified.fg = "#ff8800";
              removed.fg = "#ec5f67";
            };
            color.bg = "#15161e";
            cond.__raw = cond_50;
          }
          
          { # Warnings, errors from LSP
            __unkeyed-1 = "diagnostics";
            color.bg = "#15161e";
            cond.__raw = cond_100;
            icon = "| ";
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
          # Tabs
          {
            # __unkeyed-1 = "tabs";
            __unkeyed-1.__raw = tabsss;
            symbols.alternate_file = ""; 
          }
        ];
        # Filename + its access options
        lualine_x = [ 
          {
            __unkeyed-2 = "filename";
            color.fg = "#c568dd";
            color.bg = "#15161e";
            cond.__raw = cond_100;
            newfile_status = true;
            path = 1;
            shorting_target = 20;
            symbols = {
              modified = "";
              readonly = "󱚳";
              newfile = "";
            };
          }
        ];
      };
      winbar = {};
    };
  };
}
