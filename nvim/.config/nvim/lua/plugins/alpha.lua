return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    local logo = [[

    ██████╗░██╗██╗░░░██╗██╗███╗░░░███╗
    ██╔══██╗██║██║░░░██║██║████╗░████║
    ██████╔╝██║╚██╗░██╔╝██║██╔████╔██║
    ██╔═══╝░██║░╚████╔╝░██║██║╚██╔╝██║
    ██║░░░░░██║░░╚██╔╝░░██║██║░╚═╝░██║
    ╚═╝░░░░░╚═╝░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝
            [ @prezakhani ]
    ]]
    opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
  end,
}
