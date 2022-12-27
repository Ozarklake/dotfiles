-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

nvim_tree_config.event = 'VimEnter'


local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
  auto_close = true,
  sort_by = "case_sensitive",
  open_on_setup = false,
  open_on_setup_file = false,
  view = {
    adaptive_size = true,
    width = 20,
    hide_root_folder = true,
    width = 20,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
  },
  update_focused_file = {
    enable = true,
    debounce_delay = 15,
    update_root = false,
    ignore_list = {},
  },
})
