vim.cmd("highlight clear")
vim.g.colors_name = "rice"
vim.o.background = "dark"

-- Terminal palette from kitty rice
local p = {
	bg = "#141216",
	dim = "#100e12",
	surface = "#2b2135",
	muted = "#3d3347",
	subtle = "#4f4559",
	faded = "#73697d",
	fg_dim = "#a09098",
	fg = "#d8cab8",
	red = "#fc4649",
	green = "#a8c870",
	yellow = "#d4d88a",
	blue = "#7b91fc",
	purple = "#AC82E9",
	deep = "#8F56E1",
	pink = "#fc92fc",
	cyan = "#92fcfa",
	orange = "#f7a162",
}

local function hi(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

-- Editor
hi("Normal", { fg = p.fg, bg = p.bg })
hi("NormalFloat", { fg = p.fg, bg = p.dim })
hi("FloatBorder", { fg = p.surface, bg = p.dim })
hi("ColorColumn", { bg = "#1a171e" })
hi("CursorLine", { bg = p.surface })
hi("CursorLineNr", { fg = p.purple, bold = true })
hi("LineNr", { fg = p.subtle })
hi("SignColumn", { bg = p.bg })
hi("Visual", { bg = p.muted })
hi("Search", { fg = p.bg, bg = p.yellow })
hi("IncSearch", { fg = p.bg, bg = p.orange })
hi("CurSearch", { fg = p.bg, bg = p.orange })
hi("Pmenu", { fg = p.fg, bg = p.dim })
hi("PmenuSel", { fg = p.fg, bg = p.muted })
hi("StatusLine", { fg = p.fg, bg = p.dim })
hi("StatusLineNC", { fg = p.faded, bg = p.dim })
hi("WinSeparator", { fg = p.surface })
hi("MatchParen", { fg = p.pink, bold = true })
hi("NonText", { fg = p.muted })
hi("EndOfBuffer", { fg = p.bg })
hi("Directory", { fg = p.blue })
hi("Title", { fg = p.purple, bold = true })
hi("ErrorMsg", { fg = p.red, bold = true })
hi("WarningMsg", { fg = p.yellow })
hi("MoreMsg", { fg = p.blue })
hi("ModeMsg", { fg = p.purple, bold = true })
hi("DiffAdd", { fg = p.green })
hi("DiffChange", { fg = p.blue })
hi("DiffDelete", { fg = p.red })

-- Syntax
hi("Comment", { fg = p.faded, italic = true })
hi("Constant", { fg = p.orange })
hi("String", { fg = p.green })
hi("Number", { fg = p.orange })
hi("Boolean", { fg = p.orange })
hi("Identifier", { fg = p.fg })
hi("Function", { fg = p.blue })
hi("Statement", { fg = p.purple })
hi("Keyword", { fg = p.purple, italic = true })
hi("Operator", { fg = p.cyan })
hi("Type", { fg = p.yellow })
hi("PreProc", { fg = p.pink })
hi("Special", { fg = p.pink })
hi("Delimiter", { fg = p.fg_dim })
hi("Error", { fg = p.red })
hi("Todo", { fg = p.yellow, bold = true })
hi("Underlined", { underline = true })

-- Diagnostics
hi("DiagnosticError", { fg = p.red })
hi("DiagnosticWarn", { fg = p.yellow })
hi("DiagnosticInfo", { fg = p.blue })
hi("DiagnosticHint", { fg = p.cyan })
hi("DiagnosticUnderlineError", { undercurl = true, sp = p.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = p.yellow })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = p.blue })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = p.cyan })
