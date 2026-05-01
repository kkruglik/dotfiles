return {
  "otavioschwanck/arrow.nvim",
  dependencies = { "nvim-mini/mini.icons" },
  event = "VeryLazy",
  opts = {
    show_icons = true,
    leader_key = ";",
    buffer_leader_key = "m",
    separate_by_branch = true,
  },
  keys = {
    { "H", function() require("arrow.persist").previous() end, desc = "Arrow prev" },
    { "L", function() require("arrow.persist").next() end, desc = "Arrow next" },
  },
}
