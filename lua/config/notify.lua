require("mini.notify").setup()

vim.notify = MiniNotify.make_notify({
  ERROR = { duration = 6000 },
  WARN = { duration = 4000 },
  INFO = { duration = 2500 },
})
