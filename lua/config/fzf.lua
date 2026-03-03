local ok, fzf = pcall(require, "fzf-lua")
if not ok then
  return
end

fzf.setup({
  winopts = {
    height = 0.85,
    width = 0.80,
    preview = {
      default = "bat",
    },
  },
  files = {
    cwd_prompt = false,
  },
  grep = {
    rg_opts = "--column --line-number --no-heading --color=never --smart-case --hidden --glob '!.git/'",
  },
})
