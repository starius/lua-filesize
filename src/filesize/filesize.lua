-- lua-filesize, generate a human readable string describing the file size
-- Copyright (c) 2016 Boris Nagaev
-- See the LICENSE file for terms of use.

local function filesize(size, options)

    local function setDefault(name, default)
        if options[name] == nil then
            options[name] = default
        end
    end
    options = options or {}
    setDefault("base", 2)
    setDefault("bits", false)
    setDefault("exponent", -1)
    setDefault("output", "string")
    setDefault("round", 2)
    setDefault("spacer", " ")
    setDefault("suffixes", {})
    setDefault("unix", false)

end

return filesize
