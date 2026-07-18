ahora para lsp, linter y formatter uso directamente
mason como instalador y agrego a 
```
    require("mason-tool-installer").setup({
        ensure_installed = { "lua_ls", "ts_ls", "basedpyright", "ruff", "eslint_d" }
    })
```

para que se asegure de usarlo
