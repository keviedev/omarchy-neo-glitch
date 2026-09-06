-- Neo Glitch colorscheme
-- Cyberpunk RGB-split neon on void black. Matches the Omarchy neo-glitch theme.
-- Palette mirrors colors.toml: void #0a0612, neon green #00ff9f, cyan #00e5ff,
-- magenta #ea00d9, red #ff2a6d, yellow #f9f871.

local palette = {
  void          = "#0a0612",
  dark_void     = "#07040c",
  darker_void   = "#040208",
  panel         = "#1c0f2e",
  selection     = "#2a1040",
  muted         = "#5d4a7a",

  fg            = "#d8f0ff",
  dark_fg       = "#7a6b9a",
  light_fg      = "#b4c8e0",
  bright_fg     = "#f4faff",

  green         = "#00ff9f",
  cyan          = "#00e5ff",
  blue          = "#0abdc6",
  magenta       = "#ea00d9",
  red           = "#ff2a6d",
  yellow        = "#f9f871",
  orange        = "#ff9e4f",
  brown         = "#8a5a44",

  bright_green  = "#7dffc9",
  bright_cyan   = "#6ff9ff",
  bright_blue   = "#4fe0e8",
  bright_magenta= "#ff6bff",
  bright_red    = "#ff5c8a",
  bright_yellow = "#fbffa5",
}

local cterm = {
  void = 0, dark_void = 0, darker_void = 0, panel = 234, selection = 234,
  muted = 60, fg = 189, dark_fg = 103, light_fg = 152, bright_fg = 195,
  green = 47, cyan = 51, blue = 44, magenta = 201, red = 197,
  yellow = 228, orange = 215, brown = 95,
  bright_green = 121, bright_cyan = 123, bright_blue = 116,
  bright_magenta = 207, bright_red = 205, bright_yellow = 229,
}

local M = {}

M.name = "neo-glitch"
M.palette = palette
M.cterm = cterm

M.base_groups = {
  -- Core editor
  Normal         = { fg = palette.fg, bg = palette.void },
  NormalNC       = { fg = palette.fg, bg = palette.void },
  NormalFloat    = { fg = palette.fg, bg = palette.dark_void },
  FloatBorder    = { fg = palette.magenta, bg = palette.dark_void },
  FloatTitle     = { fg = palette.green, bold = true },
  Cursor         = { fg = palette.void, bg = palette.green },
  CursorLine     = { bg = palette.selection },
  CursorColumn   = { bg = palette.selection },
  CursorLineNr   = { fg = palette.green, bold = true },
  LineNr         = { fg = palette.muted },
  LineNrAbove    = { fg = palette.muted },
  LineNrBelow    = { fg = palette.muted },
  SignColumn     = { fg = palette.muted, bg = palette.void },
  VertSplit      = { fg = palette.selection },
  WinSeparator   = { fg = palette.selection },
  EndOfBuffer    = { fg = palette.darker_void },
  NonText        = { fg = palette.muted },
  Whitespace     = { fg = palette.selection },
  Conceal        = { fg = palette.cyan },
  Directory      = { fg = palette.cyan, bold = true },
  Title          = { fg = palette.magenta, bold = true },
  ErrorMsg      = { fg = palette.void, bg = palette.red, bold = true },
  MoreMsg        = { fg = palette.cyan },
  ModeMsg        = { fg = palette.green },
  WarningMsg     = { fg = palette.yellow },
  Question       = { fg = palette.cyan, bold = true },
  QuickFixLine   = { bg = palette.selection, bold = true },
  qfLineNr       = { fg = palette.magenta },
  qfFileName     = { fg = palette.cyan },
  ColorColumn    = { bg = palette.dark_void },
  MatchParen     = { fg = palette.bright_yellow, bg = palette.selection, bold = true },
  Substitute     = { fg = palette.void, bg = palette.magenta },
  TermCursor     = { fg = palette.void, bg = palette.green },
  TermCursorNC   = { fg = palette.void, bg = palette.muted },

  -- Search
  Search         = { fg = palette.void, bg = palette.yellow },
  IncSearch      = { fg = palette.void, bg = palette.magenta },
  CurSearch      = { fg = palette.void, bg = palette.magenta, bold = true },
  WildMenu       = { fg = palette.void, bg = palette.cyan },

  -- Visual
  Visual         = { fg = palette.bright_fg, bg = palette.magenta },
  VisualNOS      = { bg = palette.selection },

  -- Folds
  Folded         = { fg = palette.dark_fg, bg = palette.dark_void },
  FoldColumn     = { fg = palette.muted, bg = palette.void },

  -- Popup / completion menu
  Pmenu          = { fg = palette.fg, bg = palette.dark_void },
  PmenuSel       = { fg = palette.void, bg = palette.magenta, bold = true },
  PmenuSbar      = { bg = palette.panel },
  PmenuThumb     = { bg = palette.muted },
  PmenuKind      = { fg = palette.cyan },
  PmenuKindSel   = { fg = palette.void, bg = palette.cyan },
  PmenuExtra     = { fg = palette.dark_fg },
  PmenuExtraSel  = { fg = palette.void, bg = palette.magenta },

  -- Spell
  SpellBad       = { fg = palette.red, undercurl = true },
  SpellCap       = { fg = palette.yellow, undercurl = true },
  SpellLocal     = { fg = palette.cyan, undercurl = true },
  SpellRare      = { fg = palette.magenta, undercurl = true },

  -- Messages / diagnostics
  Added          = { fg = palette.green },
  Changed        = { fg = palette.orange },
  Removed        = { fg = palette.red },
  diffAdded      = { fg = palette.green },
  diffChanged    = { fg = palette.orange },
  diffRemoved    = { fg = palette.red },
  diffOldFile    = { fg = palette.orange },
  diffNewFile    = { fg = palette.green },
  diffFile       = { fg = palette.cyan, bold = true },
  diffLine       = { fg = palette.magenta, bold = true },
  diffIndexLine = { fg = palette.magenta },

  -- Statusline / tabline
  StatusLine     = { fg = palette.fg, bg = palette.panel },
  StatusLineNC   = { fg = palette.dark_fg, bg = palette.dark_void },
  TabLine        = { fg = palette.dark_fg, bg = palette.dark_void },
  TabLineSel     = { fg = palette.void, bg = palette.green, bold = true },
  TabLineFill    = { bg = palette.darker_void },
  WinBar         = { fg = palette.fg, bg = palette.void },
  WinBarNC       = { fg = palette.dark_fg, bg = palette.void },

  -- Syntax: semantic names
  Comment        = { fg = palette.dark_fg, italic = true },
  Constant       = { fg = palette.yellow },
  String         = { fg = palette.green },
  Character      = { fg = palette.bright_green },
  Number         = { fg = palette.red },
  Boolean        = { fg = palette.magenta, bold = true },
  Float          = { fg = palette.red },
  Identifier     = { fg = palette.fg },
  Function       = { fg = palette.cyan },
  Statement      = { fg = palette.magenta, bold = true },
  Conditional    = { fg = palette.bright_magenta },
  Repeat         = { fg = palette.bright_magenta },
  Label          = { fg = palette.magenta },
  Operator       = { fg = palette.bright_cyan },
  Keyword        = { fg = palette.magenta, bold = true },
  Exception      = { fg = palette.red, bold = true },
  PreProc        = { fg = palette.orange },
  Include        = { fg = palette.orange },
  Define         = { fg = palette.orange, bold = true },
  Macro          = { fg = palette.orange },
  PreCondit      = { fg = palette.orange },
  Type           = { fg = palette.bright_yellow },
  StorageClass   = { fg = palette.magenta },
  Structure      = { fg = palette.bright_yellow },
  Typedef        = { fg = palette.bright_yellow },
  Special        = { fg = palette.bright_cyan },
  SpecialChar    = { fg = palette.orange },
  Tag            = { fg = palette.cyan, bold = true },
  Delimiter      = { fg = palette.light_fg },
  SpecialComment = { fg = palette.dark_fg, bold = true },
  Debug          = { fg = palette.red },
  Underlined     = { underline = true },
  Ignore         = { fg = palette.muted },
  Error          = { fg = palette.void, bg = palette.red, bold = true },
  Todo           = { fg = palette.void, bg = palette.yellow, bold = true },

  -- Diagnostics
  DiagnosticError = { fg = palette.red },
  DiagnosticWarn  = { fg = palette.yellow },
  DiagnosticInfo  = { fg = palette.cyan },
  DiagnosticHint  = { fg = palette.green },
  DiagnosticOk    = { fg = palette.green },
  DiagnosticUnderlineError = { fg = palette.red, undercurl = true },
  DiagnosticUnderlineWarn  = { fg = palette.yellow, undercurl = true },
  DiagnosticUnderlineInfo  = { fg = palette.cyan, undercurl = true },
  DiagnosticUnderlineHint  = { fg = palette.green, undercurl = true },

  -- Git
  gitHash        = { fg = palette.orange },
  gitSummary     = { fg = palette.magenta, bold = true },
  gitReference   = { fg = palette.yellow },
  gitBranch      = { fg = palette.magenta },
  gitKeyword     = { fg = palette.magenta },
  gitCommitBranch = { fg = palette.magenta, bold = true },
}

M.markup_groups = {
  ["@markup.heading"]     = { fg = palette.magenta, bold = true },
  ["@markup.heading.1"]   = { fg = palette.magenta, bold = true },
  ["@markup.heading.2"]   = { fg = palette.cyan, bold = true },
  ["@markup.heading.3"]   = { fg = palette.green, bold = true },
  ["@markup.heading.4"]   = { fg = palette.yellow, bold = true },
  ["@markup.italic"]       = { italic = true },
  ["@markup.bold"]         = { bold = true },
  ["@markup.strikethrough"] = { strikethrough = true },
  ["@markup.underline"]    = { underline = true },
  ["@markup.quote"]        = { fg = palette.dark_fg, italic = true },
  ["@markup.raw"]          = { fg = palette.green },
  ["@markup.link"]         = { fg = palette.cyan, underline = true },
  ["@markup.list"]         = { fg = palette.orange },
}

M.ts_groups = {
  ["@annotation"]           = { fg = palette.orange },
  ["@attribute"]            = { fg = palette.orange },
  ["@boolean"]              = { fg = palette.magenta },
  ["@character.special"]    = { fg = palette.bright_green },
  ["@comment"]              = { fg = palette.dark_fg, italic = true },
  ["@comment.documentation"] = { fg = palette.muted },
  ["@conditional"]          = { fg = palette.bright_magenta },
  ["@constant"]             = { fg = palette.yellow },
  ["@constant.builtin"]     = { fg = palette.bright_yellow },
  ["@constant.macro"]       = { fg = palette.orange },
  ["@constructor"]          = { fg = palette.cyan },
  ["@embedded"]             = { fg = palette.fg },
  ["@error"]                = { fg = palette.red },
  ["@exception"]            = { fg = palette.red },
  ["@field"]                = { fg = palette.fg },
  ["@float"]                = { fg = palette.red },
  ["@function"]             = { fg = palette.cyan },
  ["@function.builtin"]     = { fg = palette.cyan, italic = true },
  ["@function.call"]        = { fg = palette.cyan },
  ["@function.macro"]       = { fg = palette.green },
  ["@include"]              = { fg = palette.orange },
  ["@keyword"]              = { fg = palette.magenta, bold = true },
  ["@keyword.conditional"]  = { fg = palette.bright_magenta },
  ["@keyword.function"]     = { fg = palette.magenta, bold = true },
  ["@keyword.operator"]     = { fg = palette.bright_cyan },
  ["@keyword.return"]       = { fg = palette.bright_magenta },
  ["@label"]                = { fg = palette.magenta },
  ["@method"]               = { fg = palette.cyan },
  ["@namespace"]            = { fg = palette.blue },
  ["@none"]                 = { fg = palette.fg },
  ["@number"]               = { fg = palette.red },
  ["@operator"]             = { fg = palette.bright_cyan },
  ["@parameter"]            = { fg = palette.fg, italic = true },
  ["@parameter.reference"]  = { fg = palette.fg },
  ["@property"]             = { fg = palette.fg },
  ["@punctuation.bracket"]  = { fg = palette.light_fg },
  ["@punctuation.delimiter"] = { fg = palette.light_fg },
  ["@punctuation.special"]   = { fg = palette.orange },
  ["@repeat"]               = { fg = palette.bright_magenta },
  ["@string"]               = { fg = palette.green },
  ["@string.escape"]        = { fg = palette.bright_magenta },
  ["@string.special"]       = { fg = palette.bright_cyan },
  ["@symbol"]               = { fg = palette.red },
  ["@tag"]                  = { fg = palette.bright_yellow },
  ["@tag.attribute"]        = { fg = palette.cyan },
  ["@tag.delimiter"]        = { fg = palette.light_fg },
  ["@text"]                 = { fg = palette.fg },
  ["@text.danger"]          = { fg = palette.red, bold = true },
  ["@text.diff.add"]        = { fg = palette.green },
  ["@text.diff.delete"]     = { fg = palette.red },
  ["@text.emphasis"]        = { italic = true },
  ["@text.environment"]     = { fg = palette.magenta },
  ["@text.environment.name"] = { fg = palette.bright_yellow },
  ["@text.literal"]         = { fg = palette.green },
  ["@text.math"]            = { fg = palette.cyan },
  ["@text.note"]            = { fg = palette.cyan, bold = true },
  ["@text.reference"]       = { fg = palette.cyan },
  ["@text.strike"]          = { strikethrough = true },
  ["@text.strong"]          = { bold = true },
  ["@text.title"]           = { fg = palette.magenta, bold = true },
  ["@text.todo"]            = { fg = palette.void, bg = palette.yellow, bold = true },
  ["@text.underline"]       = { underline = true },
  ["@text.uri"]             = { fg = palette.blue, underline = true },
  ["@text.warning"]         = { fg = palette.yellow, bold = true },
  ["@type"]                 = { fg = palette.bright_yellow },
  ["@type.builtin"]         = { fg = palette.orange },
  ["@type.definition"]      = { fg = palette.bright_yellow },
  ["@type.qualifier"]       = { fg = palette.magenta },
  ["@variable"]             = { fg = palette.fg },
  ["@variable.builtin"]     = { fg = palette.cyan, italic = true },
  ["@variable.member"]      = { fg = palette.fg },
}

M.lsp_groups = {
  ["@lsp.type.class"]         = { link = "Structure" },
  ["@lsp.type.decorator"]     = { link = "Function" },
  ["@lsp.type.enum"]          = { link = "Type" },
  ["@lsp.type.enumMember"]    = { link = "Constant" },
  ["@lsp.type.event"]         = { link = "Type" },
  ["@lsp.type.function"]      = { link = "Function" },
  ["@lsp.type.interface"]     = { link = "Type" },
  ["@lsp.type.keyword"]       = { link = "Keyword" },
  ["@lsp.type.macro"]         = { link = "Macro" },
  ["@lsp.type.method"]        = { link = "Function" },
  ["@lsp.type.modifier"]      = { link = "Keyword" },
  ["@lsp.type.namespace"]     = { link = "Namespace" },
  ["@lsp.type.number"]        = { link = "Number" },
  ["@lsp.type.operator"]      = { link = "Operator" },
  ["@lsp.type.parameter"]     = { link = "Identifier" },
  ["@lsp.type.property"]      = { link = "Property" },
  ["@lsp.type.regexp"]        = { link = "SpecialChar" },
  ["@lsp.type.string"]        = { link = "String" },
  ["@lsp.type.struct"]        = { link = "Structure" },
  ["@lsp.type.type"]          = { link = "Type" },
  ["@lsp.type.typeParameter"] = { link = "Typedef" },
  ["@lsp.type.variable"]      = { link = "Identifier" },
}

local function apply_term_colors()
  vim.g.terminal_color_0  = palette.void
  vim.g.terminal_color_1  = palette.red
  vim.g.terminal_color_2  = palette.green
  vim.g.terminal_color_3  = palette.yellow
  vim.g.terminal_color_4  = palette.blue
  vim.g.terminal_color_5  = palette.magenta
  vim.g.terminal_color_6  = palette.cyan
  vim.g.terminal_color_7  = palette.fg
  vim.g.terminal_color_8  = palette.muted
  vim.g.terminal_color_9  = palette.bright_red
  vim.g.terminal_color_10 = palette.bright_green
  vim.g.terminal_color_11 = palette.bright_yellow
  vim.g.terminal_color_12 = palette.bright_blue
  vim.g.terminal_color_13 = palette.bright_magenta
  vim.g.terminal_color_14 = palette.bright_cyan
  vim.g.terminal_color_15 = palette.bright_fg
end

local function set_hl(name, opts)
  if opts.link then
    vim.api.nvim_set_hl(0, name, { link = opts.link })
    return
  end

  local hl = {}
  for k, v in pairs(opts) do
    hl[k] = v
  end
  if vim.o.termguicolors or not cterm_only then
    hl.ctermfg = nil
    hl.ctermbg = nil
  end
  vim.api.nvim_set_hl(0, name, hl)
end

function M.load()
  if vim.version().minor < 7 then
    vim.notify("neo-glitch requires Neovim 0.7+", vim.log.levels.ERROR)
    return
  end

  vim.o.termguicolors = true
  vim.o.background = "dark"
  apply_term_colors()

  for name, opts in pairs(M.base_groups) do set_hl(name, opts) end
  for name, opts in pairs(M.markup_groups) do set_hl(name, opts) end

  if vim.fn.has("nvim-0.8") == 1 then
    for name, opts in pairs(M.ts_groups) do set_hl(name, opts) end
  end

  if vim.fn.has("nvim-0.9") == 1 then
    for name, opts in pairs(M.lsp_groups) do set_hl(name, opts) end
  end

  vim.g.colors_name = "neo-glitch"
end

M.load()

return M