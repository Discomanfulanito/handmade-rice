# Neovim Cheatsheet

A reference for the plugins and keybindings configured in this Neovim setup.

- **Leader key** (`<leader>`): `Space`
- **Local leader** (`<localleader>`): `\` (backslash)

> Notes:
> - Keys shown as `<A-...>` mean **Alt**, `<C-...>` mean **Ctrl**.
> - Sections are split into **your custom mappings**, **plugin defaults**, and
>   **Neovim built-in defaults** so you know where each comes from.

---

## Custom keymaps (defined in this config)

Defined in `lua/keymaps.lua`.

### Windows & terminal

| Key | Mode | Action |
| --- | --- | --- |
| `<Esc>` | terminal | Exit terminal mode (back to normal) |
| `<A-h>` | normal / insert / terminal | Move to the window on the **left** |
| `<A-j>` | normal / insert / terminal | Move to the window **below** |
| `<A-k>` | normal / insert / terminal | Move to the window **above** |
| `<A-l>` | normal / insert / terminal | Move to the window on the **right** |

### Diagnostics

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>e` | normal | Put buffer diagnostics into the **location list** (`vim.diagnostic.setloclist`) |

### File explorer (Neo-tree)

| Key | Mode | Action |
| --- | --- | --- |
| `-` | normal | Toggle/focus **Neo-tree** on the left, revealing the current file (or cwd if the buffer isn't a file) |

### Undotree

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>u` | normal | Toggle the **undo tree** window |

### Git (Fugitive)

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>gs` | normal | Open the **Fugitive git status** window (`:Git`) |

### Telescope (fuzzy finder)

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>pf` | normal | **Find files** by name (all files) |
| `<C-p>` | normal | **Find files tracked by git** in the repo |
| `<leader>ps` | normal | **Live grep** (search file contents) |

### Molten (Jupyter kernel)

| Key | Mode | Action |
| --- | --- | --- |
| `<leader>mi` | normal | **Initialize** Molten (`:MoltenInit`) |
| `<leader>rl` | normal | **Evaluate the current line** (`:MoltenEvaluateLine`) |
| `<leader>rr` | normal | **Re-evaluate** the current cell (`:MoltenReevaluateCell`) |
| `<leader>me` | normal | Select the surrounding ` ``` ` fenced code block and **evaluate it** as a cell |

---

## Custom commands (defined in this config)

Defined in `lua/commands.lua`.

| Command | Action |
| --- | --- |
| `:GitBlameLine` | Print the `git blame` for the current line |

### Automatic behaviors (autocommands)

These run on their own — no key needed:

- **Yank highlight** — copied/yanked text briefly flashes.
- **Clipboard sync** — clipboard is shared with the OS (`unnamedplus`) on UI enter.
- **On saving `*.ipynb`** — Molten runs `:MoltenExportOutput!` to write cell outputs back.
- **Markdown buffers** — enable wrap, linebreak, spell (`es,en`), `conceallevel=2`,
  `textwidth=80`, and hide line numbers / sign column.

---

## Plugins overview

| Plugin | Purpose |
| --- | --- |
| **lazy.nvim** | Plugin manager |
| **nvim-treesitter** | Better syntax highlighting / parsing |
| **telescope.nvim** | Fuzzy finder (files, grep, etc.) + `fzf-native` |
| **neo-tree.nvim** | File explorer sidebar |
| **vim-fugitive** | Git integration |
| **which-key.nvim** | Popup showing available keybindings |
| **nvim-cmp** | Autocompletion (with `vsnip` snippets) |
| **nvim-lspconfig** + **mason.nvim** | LSP servers + installer |
| **mason-lspconfig** / **mason-tool-installer** | Auto-install LSPs, linters, formatters |
| **conform.nvim** | Formatter (format on save) |
| **nvim-lint** | Linting framework (installed) |
| **nvim-autopairs** | Auto-close brackets/quotes |
| **lualine.nvim** | Statusline |
| **auto-session** | Automatic session save/restore |
| **undotree** | Visual undo history |
| **molten-nvim** | Run code in a Jupyter kernel inside Neovim |
| **jupytext.nvim** | Open `.ipynb` notebooks as markdown |
| **image.nvim** | Render images (kitty backend) |
| **render-markdown.nvim** | Pretty in-buffer markdown rendering |
| **zen-mode.nvim** | Distraction-free writing mode |
| **twilight.nvim** | Dim inactive portions of code |
| **dracula.nvim** | Active colorscheme |
| **tokyonight.nvim** | Alternative colorscheme (installed) |

### Managing plugins (lazy.nvim)

| Command | Action |
| --- | --- |
| `:Lazy` | Open the lazy.nvim UI (status, install, update, clean) |
| `:Lazy sync` | Install missing + update + clean plugins |
| `:Lazy update` | Update plugins |
| `:Lazy clean` | Remove plugins no longer in config |
| `:Lazy profile` | Startup profiling |

> `checker = { enabled = true }` is set, so lazy checks for updates automatically.

---

## Telescope

Launch with the custom keymaps above (`<leader>pf`, `<C-p>`, `<leader>ps`).
Inside a Telescope picker (default mappings):

| Key | Action |
| --- | --- |
| `<C-n>` / `<Down>` | Next result |
| `<C-p>` / `<Up>` | Previous result |
| `<CR>` | Open selection |
| `<C-x>` | Open in horizontal split |
| `<C-v>` | Open in vertical split |
| `<C-t>` | Open in new tab |
| `<C-u>` / `<C-d>` | Scroll the preview up / down |
| `<Tab>` | Toggle selection + move to next (multi-select) |
| `<C-q>` | Send results to the quickfix list |
| `<Esc>` | Leave insert mode (in picker); again to close |
| `<C-c>` | Close the picker |

Useful commands: `:Telescope` (list all pickers), `:Telescope find_files`,
`:Telescope live_grep`, `:Telescope buffers`, `:Telescope help_tags`,
`:Telescope keymaps`, `:Telescope resume` (reopen last picker).

---

## Neo-tree (file explorer)

Toggle with `-`. Inside the Neo-tree window (v3 defaults):

| Key | Action |
| --- | --- |
| `<CR>` / `o` | Open file / expand folder |
| `<Space>` | Toggle node (expand/collapse) |
| `S` | Open in horizontal split |
| `s` | Open in vertical split |
| `t` | Open in new tab |
| `a` | Add a file/folder (end with `/` for a folder) |
| `d` | Delete |
| `r` | Rename |
| `c` | Copy |
| `x` | Cut |
| `p` | Paste |
| `y` | Copy path to clipboard |
| `H` | Toggle hidden files |
| `R` | Refresh |
| `/` | Fuzzy filter |
| `<` / `>` | Previous / next source |
| `.` | Set current node as root |
| `q` | Close the window |
| `?` | Show full help with all mappings |

Commands: `:Neotree toggle`, `:Neotree focus`, `:Neotree reveal`, `:Neotree close`,
`:Neotree buffers`, `:Neotree git_status`.

> A window picker is configured, so opening a file may prompt you to pick a target window.

---

## Git — Fugitive

| Command | Action |
| --- | --- |
| `:Git` or `:G` | Open the git status window (also `<leader>gs`) |
| `:Git blame` | Blame view for the current file |
| `:Gdiffsplit` | Diff the current file against the index/HEAD |
| `:Gread` | Reset the buffer to the index version (like `git checkout`) |
| `:Gwrite` | Write and stage the file (like `git add`) |
| `:Gclog` | Load commit history into the quickfix list |
| `:Git push` / `:Git pull` | Run the corresponding git command |
| `:GitBlameLine` | (custom) blame just the current line |

Inside the `:Git` status window (common mappings):

| Key | Action |
| --- | --- |
| `s` | Stage the file/hunk under the cursor |
| `u` | Unstage |
| `-` | Toggle staged/unstaged |
| `=` | Toggle inline diff for the file |
| `dd` | Open a diff split for the file |
| `cc` | Create a commit |
| `ca` | Amend the last commit |
| `X` | Discard changes under the cursor |
| `<CR>` | Open the file |
| `g?` | Show help for the status window |

---

## Completion — nvim-cmp

Active while typing (insert mode) and in the command line:

| Key | Action |
| --- | --- |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm the selected item |
| `<C-e>` | Abort / close the menu |
| `<C-b>` | Scroll documentation up |
| `<C-f>` | Scroll documentation down |

Sources: LSP, vsnip snippets, signature help, and buffer words. In the command
line, `/` and `?` complete from the buffer, and `:` completes paths and commands.

---

## LSP (Neovim built-in defaults)

LSP servers are installed via Mason and enabled automatically. When a server is
attached, these **Neovim 0.11+ built-in** mappings are available (no extra config):

| Key | Mode | Action |
| --- | --- | --- |
| `K` | normal | Hover documentation |
| `grn` | normal | Rename symbol |
| `gra` | normal / visual | Code action |
| `grr` | normal | Find references |
| `gri` | normal | Go to implementation |
| `grt` | normal | Go to type definition |
| `gO` | normal | Document symbols |
| `gd` | normal | Go to definition |
| `gD` | normal | Go to declaration |
| `<C-s>` | insert | Signature help |
| `[d` / `]d` | normal | Previous / next diagnostic |
| `<C-w>d` | normal | Show diagnostic in a float |

Installed servers/tools (via mason-tool-installer): `lua_ls`, `ts_ls`,
`basedpyright`, `ruff`, `eslint_d`.

Useful commands: `:Mason` (installer UI), `:LspInfo`, `:LspRestart`,
`:checkhealth lsp`.

---

## Formatting — conform.nvim

Formats **automatically on save** (500ms timeout, falls back to LSP formatting).

| Filetype | Formatter |
| --- | --- |
| lua | `stylua` |
| python | `ruff_format` |
| rust | `rustfmt` (LSP fallback) |
| javascript | `prettierd` → `prettier` |

Manual command: `:ConformInfo` shows formatter status for the buffer.

---

## Sessions — auto-session

Sessions save/restore automatically per working directory. Manual commands:

| Command | Action |
| --- | --- |
| `:AutoSession save [name]` | Save the current session (optionally named) |
| `:AutoSession restore [name]` | Restore a session |
| `:AutoSession delete [name]` | Delete a session |
| `:AutoSession disable` / `enable` / `toggle` | Control autosave |
| `:AutoSession search` | Open a session picker |
| `:AutoSession deletePicker` | Pick a session to delete |
| `:AutoSession purgeOrphaned` | Remove sessions whose directory is gone |

---

## Jupyter workflow — Molten + jupytext + image.nvim

- `.ipynb` files open as **markdown** (jupytext), so you edit notebooks as text.
- Run code with the Molten keymaps: `<leader>mi` (init), `<leader>rl` (line),
  `<leader>rr` (re-eval cell), `<leader>me` (eval fenced block).
- Image outputs render inline via image.nvim (kitty backend).

Handy Molten commands beyond the mapped ones:

| Command | Action |
| --- | --- |
| `:MoltenInit` | Start / attach a kernel |
| `:MoltenEvaluateLine` | Run the current line |
| `:MoltenEvaluateVisual` | Run the visual selection |
| `:MoltenReevaluateCell` | Re-run the current cell |
| `:MoltenEnterOutput` | Focus into the output window (use `noautocmd`) |
| `:MoltenHideOutput` | Hide the output window |
| `:MoltenDelete` | Delete the current cell's output |
| `:MoltenExportOutput` | Export outputs to the `.ipynb` (auto-runs on save) |
| `:MoltenRestart` | Restart the kernel |

> Auto-open output is **off**; use `:noautocmd MoltenEnterOutput` to reopen output.

---

## Writing / focus modes

| Command | Plugin | Action |
| --- | --- | --- |
| `:ZenMode` | zen-mode.nvim | Toggle distraction-free mode (80-col centered, no numbers) |
| `:Twilight` | twilight.nvim | Toggle dimming of inactive code |
| `:RenderMarkdown toggle` | render-markdown.nvim | Toggle pretty markdown rendering |

---

## which-key

which-key shows a popup of available follow-up keys. Just **press `<leader>`
(Space) and wait ~200ms** to see the menu. It also has previews for marks (`` ` ``),
registers (`"`), and spelling suggestions (`z=`). The **helix** preset is used.

---

## Editor options worth remembering

Set in `lua/options.lua`:

- Indentation: tabs, width **4**.
- **Relative + absolute** line numbers.
- **Persistent undo** stored in `~/.vim/undodir` (no swap/backup files).
- Case-insensitive search, but **smartcase** (capital letters make it sensitive).
- `wrap` is **off** globally (but on for markdown).
- `splitright` on — vertical splits open to the right.
- `confirm` on — prompts to save instead of failing on `:q` with unsaved changes.

