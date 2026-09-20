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
    icon = icon or ""

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
    tab_content = tab_content:gsub("%%", "%%%%")
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
        theme = let
          mode = accent: {
            a = { fg = "#181616"; bg = accent; gui = "bold"; };
            b = { fg = "#c5c9c5"; bg = "#282727"; };
            c = { fg = "#c5c9c5"; bg = "#181616"; };
          };
        in {
          normal = mode "#8ba4b0";
          insert = mode "#87a987";
          visual = mode "#a292a3";
          replace = mode "#c4746e";
          command = mode "#c4b28a";
          terminal = mode "#8ea4a2";
          inactive = {
            a = { fg = "#a6a69c"; bg = "#181616"; };
            b = { fg = "#a6a69c"; bg = "#181616"; };
            c = { fg = "#a6a69c"; bg = "#181616"; };
          };
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
            __unkeyed-1 = "mode";
            color.__raw = ''
              function()
                local colors = {
                  n = '#8ba4b0', i = '#87a987', v = '#a292a3', V = '#a292a3',
                  c = '#c4b28a', s = '#b6927b', S = '#b6927b',
                  R = '#c4746e', r = '#b6927b', t = '#8ea4a2', ['!'] = '#c4746e',
                  [string.char(22)] = '#a292a3', [string.char(19)] = '#b6927b',
                }
                return {
                  fg = colors[vim.api.nvim_get_mode().mode:sub(1, 1)] or '#c5c9c5',
                  bg = '#181616', gui = 'bold',
                }
              end
            '';
            icon = "";
          }

          { # Filesize
            __unkeyed-1 = "filesize";
            color.fg = "#c5c9c5";
            color.bg = "#181616";
            color.gui = "bold";
            cond.__raw = cond_80;
          }

          { # Location
            __unkeyed-1 = "location";
            color.fg = "#c5c9c5";
            color.bg = "#181616";
            color.gui = "bold";
          }

          { # Progress
            __unkeyed-1 = "progress";
            color.fg = "#c5c9c5";
            color.bg = "#181616";
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
                  local names = {}
                  for _, client in ipairs(vim.lsp.get_clients({ bufnr = 0 })) do
                    table.insert(names, client.name)
                  end
                  table.sort(names)
                  return table.concat(names, ", ")
                end
              '';
            };
            color = {
              fg = "#c5c9c5";
              bg = "#181616";
              gui = "bold";
            };
            icon = " LSP: ";
            cond.__raw = cond_80;
          }
          # Offset for better positioning
          "%="

          { # Git branchname
            __unkeyed-1 = "branch";
            color.fg = "#8992a7";
            color.bg = "#181616";
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
              added.fg = "#87a987";
              modified.fg = "#b6927b";
              removed.fg = "#c4746e";
            };
            color.bg = "#181616";
            cond.__raw = cond_50;
          }

          { # Warnings, errors from LSP
            __unkeyed-1 = "diagnostics";
            color.bg = "#181616";
            cond.__raw = cond_100;
            icon = "| ";
            diagnostics_color = {
              error.fg = "#c4746e";
              warn.fg = "#c4b28a";
              info.fg = "#8ba4b0";
              hint.fg = "#8ea4a2";
            };
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
            __unkeyed-1 = "filename";
            color.fg = "#a292a3";
            color.bg = "#181616";
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
