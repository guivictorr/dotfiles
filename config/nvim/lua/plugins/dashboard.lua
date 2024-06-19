local logo = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]

local quotes = {
  "calma vscodo...",
  "brio, se tem brio ?",
  "os circuitos de consagração social são tão mais valiosos quanto maior for\n a distância social entre consagrador e objeto consagrado.",
  "ta pronto, só falta testar",
  "42",
}

math.randomseed(os.time())
local quote = quotes[math.random(1, #quotes)]
logo = string.rep("\n", 4) .. logo .. "\n" .. quote .. "\n\n"

return {
  {
    "nvimdev/dashboard-nvim",
    lazy = false,
    opts = {
      config = {
        header = vim.split(logo, "\n"),
      },
    },
  },
}
