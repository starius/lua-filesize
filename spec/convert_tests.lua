-- lua-filesize, generate a human readable string describing the file size
-- Copyright (c) 2016 Boris Nagaev
-- See the LICENSE file for terms of use.

-- Converts filesize.js/test/filesize_test.js tests to Busted-based tests

local function trim(text)
    text = text:gsub("%s+$", "")
    text = text:gsub("^%s+", "")
    return text
end

local function removeMultispace(text)
    text = text:gsub(" +", " ")
    return text
end

local function convertDict(text)
    text = text:gsub(":", " =")
    return text
end

local function removeThis(text)
    text = text:gsub("this%.", "")
    return text
end

local variables = {}
local tests = {}

for line in io.stdin:lines() do

    -- this.kilobit  = 500;
    local variable, value = line:match("this%.(.*)=(.*);")
    if variable then
        table.insert(variables, {
            variable = trim(variable),
            value = trim(value),
        })
    end

    -- test.equal(filesize(...), ..., "description");
    local expression, expected, description =
        line:match("test.equal%((filesize%b()), *([^,]+), *(.*)%);")
    if expression then
        expression = removeMultispace(expression)
        expression = convertDict(expression)
        expression = removeThis(expression)
        expected = removeMultispace(expected)
        table.insert(tests, {
            expression = expression,
            expected = expected,
            description = description,
        })
    end
end

print[[
-- lua-filesize, generate a human readable string describing the file size
-- Copyright (c) 2016 Boris Nagaev
-- See the LICENSE file for terms of use.

-- This file was generated from filesize_test.js by convert_tests.lua

describe("tests from filesize.js", function()

    local filesize = require 'filesize'
]]

for _, v in ipairs(variables) do
    print(("    local %s = %s"):format(v.variable, v.value))
end

for _, t in ipairs(tests) do
    print(([[

    it(%s, function()
        assert.equal(%s, %s)
    end)]]):format(t.description, t.expected, t.expression))
end

print[[

end)]]
