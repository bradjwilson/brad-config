
-- Setup cmake.
local status_ok, nvcmake = pcall(require, "cmake")
if not status_ok then
  return
end

local status_ok, nrange = pcall(require, "range-highlight")
if not status_ok then
  return
end


nrange.setup{}

progress = ""

nvcmake.setup {
  configure_args = { '-DBLE_DFU_SUPPORT_ENABLED=0',
                    '-Wall',
                    '-Wextra',
                    '-Wno-unused-function',
                    '-Wno-unused-parameter',
                    '-fdump-tree-all-graph',
                    '-Wno-expansion-to-defined',
                    '-Wfatal-errors -Werror'},
  on_build_output = function(lines)
    -- Get only last line
  end
}
