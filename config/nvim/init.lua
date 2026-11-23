-- ==========================================
-- 1. APPEARANCE & COLORS
-- ==========================================
vim.opt.termguicolors = true -- Enables 24-bit RGB colors (essential for nice themes)
vim.opt.cursorline = true    -- Highlights the line your cursor is currently on
vim.opt.signcolumn = "no"   -- Keeps a column open on the left (prevents screen jumping when errors pop up)

-- Set a built-in colorscheme. 
-- Recent Neovim versions include cool defaults like 'habamax', 'lunaperche', or 'retrobox'
vim.cmd.colorscheme('slate') 

-- ==========================================
-- 2. LINE NUMBERS
-- ==========================================
vim.opt.number = true         -- Shows the absolute line number on your current line
vim.opt.relativenumber = true -- Shows relative numbers on other lines (makes jumping with '5j' or '3k' super easy!)

-- ==========================================
-- 3. QUALITY OF LIFE BEHAVIOR
-- ==========================================
vim.opt.mouse = "a"           -- Enables clicking and scrolling with your mouse
vim.opt.clipboard = "unnamedplus" -- Syncs Neovim's clipboard with your system (Ctrl+C / Ctrl+V works everywhere!)
vim.opt.wrap = false          -- Prevents long lines from wrapping to the next line

-- ==========================================
-- 4. SEARCHING
-- ==========================================
vim.opt.ignorecase = true     -- Searches ignore uppercase/lowercase...
vim.opt.smartcase = true      -- ...UNLESS you type a capital letter, then it becomes case-sensitive
vim.opt.hlsearch = false      -- Stops keeping search terms highlighted after you are done searching

-- ==========================================
-- 5. INDENTATION
-- ==========================================
vim.opt.tabstop = 4           -- 1 tab = 4 spaces
vim.opt.shiftwidth = 4        -- Indent size
vim.opt.expandtab = true      -- Converts tabs to spaces (standard for most programming)
