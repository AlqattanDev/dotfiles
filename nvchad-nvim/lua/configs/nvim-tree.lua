local options = {
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    update_root = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
}

return options