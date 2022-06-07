_G.dump = function(...)
  print(vim.inspect(...))
end

_G.prequire = function(...)
  local status, lib = pcall(require, ...)
  if status then
    return lib
  end
  return nil
end

local M = {}

function M.t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function M.log(msg, hl, name)
  name = name or "Neovim"
  hl = hl or "Todo"
  vim.api.nvim_echo({ { name .. ": ", hl }, { msg } }, true, {})
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

function M.get_os_name()
    local raw_os_name = ''

    -- LuaJIT shortcut
    if jit and jit.os then
        raw_os_name = jit.os
    else
        if package.config:sub(1, 1) == '\\' then
            local env_OS = os.getenv('OS')
            if env_OS then
                raw_os_name = env_OS
            end
        else
            raw_os_name = io.popen('uname -s', 'r'):read('*l')
        end
    end

    raw_os_name = (raw_os_name):lower()

    local os_patterns = {
        ['windows'] = 'Windows',
        ['linux']   = 'Linux',
        ['osx']     = 'Mac',
        ['mac']     = 'Mac',
        ['darwin']  = 'Mac',
        ['^mingw']  = 'Windows',
        ['^cygwin'] = 'Windows',
        ['bsd$']    = 'BSD',
        ['sunos']   = 'Solaris',
    }

    local os_name = 'unknown'

    for pattern, name in pairs(os_patterns) do
        if raw_os_name:match(pattern) then
            os_name = name
            break
        end
    end
    return os_name
end

return M
