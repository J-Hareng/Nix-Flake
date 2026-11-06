-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
--- set leader key to space
vim.g.mapleader = " "

local map = vim.keymap.set
---------------------
-- General Keymaps -------------------
-- use jk to exit insert mode
map("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
map("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
map("n", "<leader>s%", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", '<leader>s"', "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

-- keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
-- keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
-- keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
-- keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
-- keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- In visual mode, use Tab to indent
map("v", "<Tab>", ">gv", { noremap = true, silent = true })
-- In visual mode, use Shift+Tab to dedent
map("v", "<S-Tab>", "<gv", { noremap = true, silent = true })
--
-- Telescope keybindings
-- map("n", "<leader>fs", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd" })

-- Toggle line comment
map("n", "<C-k><C-u>", "gcc", { desc = "Toggle comment", remap = true })
map("v", "<C-k><C-u>", "gc", { desc = "Toggle comment", remap = true })

map("n", "<leader><C-r>", ":source $MYVIMRC<CR>", { desc = "Reload config" })
-- CopolitChat
map({ "n", "v" }, "<leader>ct", "<cmd>:CopilotChat<CR>", { desc = "Open CopilotChat" }) -- Add any additional keymaps here
--
map("n", "<leader>uc", "<cmd>ColorizerToggle<CR>", { desc = "Toggle colorizer" })
