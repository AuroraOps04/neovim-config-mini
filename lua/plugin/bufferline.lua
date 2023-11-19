local status_ok, bufferline = pcall(require, "bufferline")

if status_ok then
  bufferline.setup(
    {
      options = {
        theme_able = true,
        numbers = "ordinal",
        -- indicator = {
        --   style = "icon",
        --   icon = "|"
        -- },
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explore",
            highlight = 'Directory',
            separator = true
          },
        },
      },
      highlights = {
        -- indicator_selected = {
        --   fg = "#FFFFFF",
        --   bg = "#FFFFFF",
        --   bold = true,
        --   italic = false,
        --   underdobule = true,
        --   underline = true,
        -- }
      },
    }
  )
else
  vim.notify('bufferline not loaded', vim.log.levels.WARN)
end
