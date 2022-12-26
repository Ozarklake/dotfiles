local status_ok, autosave = pcall(require, "auto-save")
if not status_ok then
  return
end

autosave.setup({
  enabled = true,
  execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
  events = {"InsertLeave", "TextChanged"}
})
