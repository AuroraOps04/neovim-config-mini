local status_ok, devicons = pcall(require, "nvim-web-devicons")

if not status_ok then
  vim.notify("nvim-web-devicons not ready", vim.log.levels.WARN)
  return
end
devicons.setup({
  override = {
    go = {
      icon = "",
      name = "Go",
      color = "#83C092",
    },
  },
})
