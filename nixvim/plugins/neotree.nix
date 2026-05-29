{
  programs.nixvim.plugins.neo-tree = {
    enable = true;
    filesystem.follow_current_file.enabled = true;
    close_if_last_window = true;
  };
}
