-- mod-version:3
local syntax = require "core.syntax"

syntax.add {
  name = "JavaScript",
  files = { "%.js$", "%.json$", "%.cson$", "%.mjs$", "%.cjs$" },
  comment = "//",
  block_comment = { "/*", "*/" },
  patterns = {
    -- Comments
    { pattern = "//.*",                 type = "comment"  },
    { pattern = { "/%*", "%*/" },       type = "comment"  },
    -- Strings
    { pattern = { '"', '"', '\\' },     type = "string"   },
    { pattern = { "'", "'", '\\' },     type = "string"   },
    { pattern = { "`", "`", '\\' },     type = "string"   },
    -- Numbers
    { pattern = "0x[%da-fA-F_]+n?",     type = "number"   },
    { pattern = "-?%d+[%d%.eE_n]*",     type = "number"   },
    { pattern = "-?%.?%d+",             type = "number"   },
    -- Embedded html like that used on React
    { pattern = { "<%s*>", "<%s*/%s*>" },
      type = "operator", syntax = ".html"
    },
    { regex = "<\\s*/()\\s*()[\\w\\d\\-_]+()\\s*>",
      type = { "operator", "normal", "function", "operator" }
    },
    { regex = "<\\s*()[\\w\\d\\-_]+(?=.*/>)",
      type = { "operator", "function" }, syntax = ".html"
    },
    { regex = { "<\\s*()[\\w\\d\\-_]+()(?=.*>)", "</().*()>" },
      type = { "operator", "function", "operator" }, syntax = ".html"
    },
    { regex = { "^\\s*<\\s*()(?=[\\w\\d\\-_]\\s*.*)()", "</().*()>" },
      type = { "operator", "function", "operator" }, syntax = ".html"
    },
    -- Regex string
    { pattern = { '/[^= ]', '/[gim]*', '\\' },type = "string"   },
    -- Operators
    { pattern = "[%+%-=/%*%^%%<>!~|&]", type = "operator" },
    -- Functions
    { pattern = "[%a_][%w_]*%s*%f[(]",     type = "function" },
    { pattern = "[%a_][%w_]*",          type = "symbol"   },
  },
  symbols = {
    ["async"]      = "keyword",
    ["await"]      = "keyword",
    ["break"]      = "keyword",
    ["case"]       = "keyword",
    ["catch"]      = "keyword",
    ["class"]      = "keyword",
    ["const"]      = "keyword",
    ["continue"]   = "keyword",
    ["debugger"]   = "keyword",
    ["default"]    = "keyword",
    ["delete"]     = "keyword",
    ["do"]         = "keyword",
    ["else"]       = "keyword",
    ["export"]     = "keyword",
    ["extends"]    = "keyword",
    ["finally"]    = "keyword",
    ["for"]        = "keyword",
    ["from"]       = "keyword",
    ["function"]   = "keyword",
    ["get"]        = "keyword",
    ["if"]         = "keyword",
    ["import"]     = "keyword",
    ["in"]         = "keyword",
    ["of"]         = "keyword",
    ["instanceof"] = "keyword",
    ["let"]        = "keyword",
    ["new"]        = "keyword",
    ["return"]     = "keyword",
    ["set"]        = "keyword",
    ["static"]     = "keyword",
    ["super"]      = "keyword",
    ["switch"]     = "keyword",
    ["throw"]      = "keyword",
    ["try"]        = "keyword",
    ["typeof"]     = "keyword",
    ["var"]        = "keyword",
    ["void"]       = "keyword",
    ["while"]      = "keyword",
    ["with"]       = "keyword",
    ["yield"]      = "keyword",
    ["true"]       = "literal",
    ["false"]      = "literal",
    ["null"]       = "literal",
    ["undefined"]  = "literal",
    ["arguments"]  = "keyword2",
    ["Infinity"]   = "keyword2",
    ["NaN"]        = "keyword2",
    ["this"]       = "keyword2",
  },
}
