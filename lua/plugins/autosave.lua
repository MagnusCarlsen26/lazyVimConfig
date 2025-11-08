return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true, -- start enabled
      execution_message = {
        message = function()
          return ""
        end,
        cleaning_interval = 0,
      },
      trigger_events = { "InsertLeave", "TextChanged" },
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")
        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true
        end
        return false
      end,
      write_all_buffers = false,
      debounce_delay = 1000, -- ms delay before saving
    })
  end,
}
