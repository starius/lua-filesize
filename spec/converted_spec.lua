-- lua-filesize, generate a human readable string describing the file size
-- Copyright (c) 2016 Boris Nagaev
-- See the LICENSE file for terms of use.

-- This file was generated from filesize_test.js by convert_tests.lua

describe("tests from filesize.js", function()

    local filesize = require 'filesize'

    local kilobit = 500
    local edgecase = 1023
    local kilobyte = 1024
    local neg = -1024
    local byte = 1
    local zero = 0
    local invld = "abc"

    it("Should be '500 B'", function()
        assert.equal("500 B", filesize(kilobit))
    end)

    it("Should be '500 B'", function()
        assert.equal("500 B", filesize(kilobit, {round = 1}))
    end)

    it("Should be '500B'", function()
        assert.equal("500B", filesize(kilobit, {round = 1, spacer = ""}))
    end)

    it("Should be '500'", function()
        assert.equal("500", filesize(kilobit, {unix = true}))
    end)

    it("Should be '3.9 Kb'", function()
        assert.equal("3.9 Kb", filesize(kilobit, {round = 1, bits = true}))
    end)

    it("Should be '3.91 Kb'", function()
        assert.equal("3.91 Kb", filesize(kilobit, {bits  =true}))
    end)

    it("Should be '3.9K'", function()
        assert.equal("3.9K", filesize(kilobit, {unix = true, bits = true}))
    end)

    it("Should be '1023 B'", function()
        assert.equal("1023 B", filesize(edgecase))
    end)

    it("Should be '1023 B'", function()
        assert.equal("1023 B", filesize(edgecase, {round = 1}))
    end)

    it("Should be '1 KB'", function()
        assert.equal("1 KB", filesize(kilobyte))
    end)

    it("Should be '1 KB'", function()
        assert.equal("1 KB", filesize(kilobyte, {round = 1}))
    end)

    it("Should be '1KB'", function()
        assert.equal("1KB", filesize(kilobyte, {round = 1, spacer = ""}))
    end)

    it("Should be '1K'", function()
        assert.equal("1K", filesize(kilobyte, {unix = true}))
    end)

    it("Should be '8 Kb'", function()
        assert.equal("8 Kb", filesize(kilobyte, {bits  =true}))
    end)

    it("Should be '8 Kb'", function()
        assert.equal("8 Kb", filesize(kilobyte, {round = 1, bits = true}))
    end)

    it("Should be '8K'", function()
        assert.equal("8K", filesize(kilobyte, {unix = true, bits = true}))
    end)

    it("Should be '1024 B'", function()
        assert.equal("1024 B", filesize(kilobyte, {exponent = 0}))
    end)

    it("Should be '1'", function()
        assert.equal(1, filesize(kilobyte, {output = "exponent"}))
    end)

    it("Should be '-1 KB'", function()
        assert.equal("-1 KB", filesize(neg))
    end)

    it("Should be '-1 KB'", function()
        assert.equal("-1 KB", filesize(neg, {round = 1}))
    end)

    it("Should be '-1KB'", function()
        assert.equal("-1KB", filesize(neg, {round = 1, spacer = ""}))
    end)

    it("Should be '-1K'", function()
        assert.equal("-1K", filesize(neg, {unix = true}))
    end)

    it("Should be '-8 Kb'", function()
        assert.equal("-8 Kb", filesize(neg, {bits  =true}))
    end)

    it("Should be '-8 Kb'", function()
        assert.equal("-8 Kb", filesize(neg, {round = 1, bits = true}))
    end)

    it("Should be '-8K'", function()
        assert.equal("-8K", filesize(neg, {unix = true, bits = true}))
    end)

    it("Should be '1 B'", function()
        assert.equal("1 B", filesize(byte))
    end)

    it("Should be '1 B'", function()
        assert.equal("1 B", filesize(byte, {round = 1}))
    end)

    it("Should be '1B'", function()
        assert.equal("1B", filesize(byte, {round = 1, spacer = ""}))
    end)

    it("Should be '1'", function()
        assert.equal("1", filesize(byte, {unix = true}))
    end)

    it("Should be '8 b'", function()
        assert.equal("8 b", filesize(byte, {bits  =true}))
    end)

    it("Should be '8 b'", function()
        assert.equal("8 b", filesize(byte, {round = 1, bits = true}))
    end)

    it("Should be '8'", function()
        assert.equal("8", filesize(byte, {unix = true, bits = true}))
    end)

    it("Should be '0 B'", function()
        assert.equal("0 B", filesize(zero))
    end)

    it("Should be '0 B'", function()
        assert.equal("0 B", filesize(zero, {round = 1}))
    end)

    it("Should be '0B'", function()
        assert.equal("0B", filesize(zero, {round = 1, spacer = ""}))
    end)

    it("Should be '0'", function()
        assert.equal("0", filesize(zero, {unix = true}))
    end)

    it("Should be '0 b'", function()
        assert.equal("0 b", filesize(zero, {bits  =true}))
    end)

    it("Should be '0 b'", function()
        assert.equal("0 b", filesize(zero, {round = 1, bits = true}))
    end)

    it("Should be '0'", function()
        assert.equal("0", filesize(zero, {unix = true, bits = true}))
    end)

    it("Should be '500 B'", function()
        assert.equal("500 B", filesize(kilobit, {base = 10}))
    end)

    it("Should be '500 B'", function()
        assert.equal("500 B", filesize(kilobit, {base = 10, round = 1}))
    end)

    it("Should be '500B'", function()
        assert.equal("500B", filesize(kilobit, {base = 10, round = 1, spacer = ""}))
    end)

    it("Should be '500'", function()
        assert.equal("500", filesize(kilobit, {base = 10, unix = true}))
    end)

    it("Should be '4 kb'", function()
        assert.equal("4 kb", filesize(kilobit, {base = 10, bits  =true}))
    end)

    it("Should be '4 kb'", function()
        assert.equal("4 kb", filesize(kilobit, {base = 10, round = 1, bits = true}))
    end)

    it("Should be '4k'", function()
        assert.equal("4k", filesize(kilobit, {base = 10, unix = true, bits = true}))
    end)

    it("Should be '1.02 kB'", function()
        assert.equal("1.02 kB", filesize(kilobyte, {base = 10}))
    end)

    it("Should be '1 kB'", function()
        assert.equal("1 kB", filesize(kilobyte, {base = 10, round = 1}))
    end)

    it("Should be '1kB'", function()
        assert.equal("1kB", filesize(kilobyte, {base = 10, round = 1, spacer = ""}))
    end)

    it("Should be '1k'", function()
        assert.equal("1k", filesize(kilobyte, {base = 10, unix = true}))
    end)

    it("Should be '8.19 kb'", function()
        assert.equal("8.19 kb", filesize(kilobyte, {base = 10, bits  =true}))
    end)

    it("Should be '8.2 kb'", function()
        assert.equal("8.2 kb", filesize(kilobyte, {base = 10, round = 1, bits = true}))
    end)

    it("Should be '8.2k'", function()
        assert.equal("8.2k", filesize(kilobyte, {base = 10, unix = true, bits = true}))
    end)

    it("Should be '-1.02 kB'", function()
        assert.equal("-1.02 kB", filesize(neg, {base = 10}))
    end)

    it("Should be '-1 kB'", function()
        assert.equal("-1 kB", filesize(neg, {base = 10, round = 1}))
    end)

    it("Should be '-1kB'", function()
        assert.equal("-1kB", filesize(neg, {base = 10, round = 1, spacer = ""}))
    end)

    it("Should be '-1k'", function()
        assert.equal("-1k", filesize(neg, {base = 10, unix = true}))
    end)

    it("Should be '-8.19 kb'", function()
        assert.equal("-8.19 kb", filesize(neg, {base = 10, bits  =true}))
    end)

    it("Should be '-8.2 kb'", function()
        assert.equal("-8.2 kb", filesize(neg, {base = 10, round = 1, bits = true}))
    end)

    it("Should be '-8.2k'", function()
        assert.equal("-8.2k", filesize(neg, {base = 10, unix = true, bits = true}))
    end)

    it("Should be '1 B'", function()
        assert.equal("1 B", filesize(byte, {base = 10}))
    end)

    it("Should be '1 B'", function()
        assert.equal("1 B", filesize(byte, {base = 10, round = 1}))
    end)

    it("Should be '1B'", function()
        assert.equal("1B", filesize(byte, {base = 10, round = 1, spacer = ""}))
    end)

    it("Should be '1'", function()
        assert.equal("1", filesize(byte, {base = 10, unix = true}))
    end)

    it("Should be '8 b'", function()
        assert.equal("8 b", filesize(byte, {base = 10, bits  =true}))
    end)

    it("Should be '8 b'", function()
        assert.equal("8 b", filesize(byte, {base = 10, round = 1, bits = true}))
    end)

    it("Should be '8'", function()
        assert.equal("8", filesize(byte, {base = 10, unix = true, bits = true}))
    end)

    it("Should be '0 B'", function()
        assert.equal("0 B", filesize(zero, {base = 10}))
    end)

    it("Should be '0 B'", function()
        assert.equal("0 B", filesize(zero, {base = 10, round = 1}))
    end)

    it("Should be '0B'", function()
        assert.equal("0B", filesize(zero, {base = 10, round = 1, spacer = ""}))
    end)

    it("Should be '0'", function()
        assert.equal("0", filesize(zero, {base = 10, unix = true}))
    end)

    it("Should be '0 b'", function()
        assert.equal("0 b", filesize(zero, {base = 10, bits  =true}))
    end)

    it("Should be '0 b'", function()
        assert.equal("0 b", filesize(zero, {base = 10, round = 1, bits = true}))
    end)

    it("Should be '0'", function()
        assert.equal("0", filesize(zero, {base = 10, unix = true, bits = true}))
    end)

    it("Should be '1 Б'", function()
        assert.equal("1 Б", filesize(byte, {suffixes = {B = "Б"}}))
    end)

    it("Should be '1 KB'", function()
        assert.equal("1 KB", filesize(kilobyte, {suffixes = {B = "Б"}}))
    end)

end)
