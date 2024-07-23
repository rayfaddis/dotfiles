-- lsp config
return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local clients = dofile(CWD() .. "lsp/clients.lua")
      local capabilities = require("cmp_nvim_lsp").default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )
      local on_attach = function(client, _)
        local format_msg = "    Autoformat: "
        if clients[client].auto_format then
          -- print(format_msg .. "true")
          -- vim.cmd([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
          vim.lsp.buf.formatting_sync()
        else
          -- print(format_msg .. "false")
        end
      end

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd(
        "LspAttach",
        {
          group = vim.api.nvim_create_augroup("UserLspConfig", {}),
          callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            -- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
            vim.keymap.set(
              "n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts
            )
            vim.keymap.set(
              "n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts
            )
            vim.keymap.set(
              "n",
              "<space>wl",
              function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
              end,
              opts
            )
            vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
            vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set(
              { "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts
            )
            vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
            vim.keymap.set(
              "n",
              "<space>F",
              function()
                vim.lsp.buf.format { async = true }
              end,
              opts
            )
          end,
        }
      )

      -- print("LSP Configuration:")
      for client, config in pairs(clients) do
        if not config.null_ls_sources then
          local setup = config.lspconfig_setup

          local config_msg = (setup and "true") or "false"
          -- print("  Client: " .. client)
          -- print("    Config: " .. config_msg)

          lspconfig[client].setup({
            capabilities = capabilities,
            cmd = setup and setup.cmd,
            filetypes = setup and setup.filetypes,
            init_options = setup and setup.init_options,
            on_attach = on_attach(client),
            root_dir = setup and setup.root_dir,
            settings = setup and setup.settings,
          })
        end
      end
    end,
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    event = "BufEnter",
    keys = {
      {
        "<space>e",
        "vim.diagnostic.open_float",
      },
      {
        "[d",
        "vim.diagnostic.goto_prev",
      },
      {
        "]d",
        "vim.diagnostic.goto_next",
      },
      {
        "<space>q",
        "vim.diagnostic.setloclist",
      },
    },
    lazy = true,
    opts = {},
  },
}
