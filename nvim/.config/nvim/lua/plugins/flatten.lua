return {
  "willothy/flatten.nvim",
  config = function()
    require("flatten").setup({
      window = {
        open = "current", -- Open files in the current window
      },
    })
  end,
}
