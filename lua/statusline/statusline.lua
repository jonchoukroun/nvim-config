local cmp = {}

local hi_pattern = "%%#%s#%s%%*"

function _G._statusline_component(name)
  return cmp[name]()
end

function cmp.diagnostic_status()
  local ok = "    "

  local ignore = {
    ["c"] = true, -- command mode
    ["t"] = true  -- terminal mode
  }

  local mode = vim.api.nvim_get_mode().mode

  if ignore[mode] then
    return ok
  end

  local levels = vim.diagnostic.severity
  local errors = #vim.diagnostic.get(0, {severity = levels.ERROR})
  if errors > 0 then
    return hi_pattern:format("ErrorMsg", " ✘ ")
  end

  local warnings = #vim.diagnostic.get(0, {severity = levels.WARN})
  if warnings > 0 then
    return hi_pattern:format("WarningMsg", " ▲ ")
  end

  return ok
end

function cmp.path()
    return hi_pattern:format("Normal", " %f ")
end

function cmp.git()
    local git_info = vim.b.gitsigns_status_dict
    if not git_info or git_info.head == "" then
    return ""
    end

    local head    = git_info.head
    local added   = git_info.added and (" +" .. git_info.added .. " ") or ""
    local changed = git_info.changed and (" ~" .. git_info.changed .. " ") or ""
    local removed = git_info.removed and (" -" .. git_info.removed .. " ") or ""
    if git_info.added == 0 then added = "" end
    if git_info.changed == 0 then changed = "" end
    if git_info.removed == 0 then removed = "" end

    return table.concat({
        "  ",
        head,
        added, changed, removed,
    })
end

function cmp.position()
  return hi_pattern:format("Search"," %3l:%-2c ")
end

local statusline = {
  "%{%v:lua._statusline_component('diagnostic_status')%} ",
  "%{%v:lua._statusline_component('path')%} ",
  "%{%v:lua._statusline_component('git')%} ",
  "%r",
  "%m",
  "%=",
  "%{&filetype} ",
  " %2p%% ",
  "%{%v:lua._statusline_component('position')%}"
}

vim.o.statusline = table.concat(statusline, "")
