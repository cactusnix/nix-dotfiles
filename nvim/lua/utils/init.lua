local M = {}

function M.keymap_set(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

function M.get_config_by_files(files, ctx)
  local found = vim.fs.find(files, {
    upward = true,
    path = ctx.dirname,
  })
  return found[1]
end

function M.get_config_by_lang(lang, type)
  local basic_path = vim.fn.stdpath("config") .. "/langs"
  local type_map = {
    fmt = "/formatters",
    lint = "/linters",
  }
  local lang_map = {
    lua = {
      fmt = "/stylua.toml",
    },
  }
  return basic_path
    .. vim.tbl_get(type_map, type)
    .. vim.tbl_get(lang_map, lang, type)
end

return M
