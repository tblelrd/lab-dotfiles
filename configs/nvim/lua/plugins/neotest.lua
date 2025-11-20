if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
  {
    "mfussenegger/nvim-jdtls",
    ft = { "java" },
    config = function()
      local jdtls = require("jdtls")
      local home = os.getenv("HOME")

      -- Determine workspace directory per project
      local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
      local workspace_dir = home .. "/.local/share/eclipse/" .. project_name

      local config = {
        cmd = {
          "jdtls",
          "-data", workspace_dir
        },
        root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" }),
        settings = {
          java = {
            autobuild = { enabled = false }, -- prevents automatic build to bin/
          },
        },
      }

      jdtls.start_or_attach(config)
    end,
  },
}
