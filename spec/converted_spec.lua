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
        assert.equal(filesize(kilobit), "500 B")
    end)

    it("Should be '500 B'", function()
        assert.equal(filesize(kilobit, {round = 1}), "500 B")
    end)

    it("Should be '500B'", function()
        assert.equal(filesize(kilobit, {round = 1, spacer = ""}), "500B")
    end)

    it("Should be '500'", function()
        assert.equal(filesize(kilobit, {unix = true}), "500")
    end)

    it("Should be '3.9 Kb'", function()
        assert.equal(filesize(kilobit, {round = 1, bits = true}), "3.9 Kb")
    end)

    it("Should be '3.91 Kb'", function()
        assert.equal(filesize(kilobit, {bits  =true}), "3.91 Kb")
    end)

    it("Should be '3.9K'", function()
        assert.equal(filesize(kilobit, {unix = true, bits = true}), "3.9K")
    end)

    it("Should be '1023 B'", function()
        assert.equal(filesize(edgecase), "1023 B")
    end)

    it("Should be '1023 B'", function()
        assert.equal(filesize(edgecase, {round = 1}), "1023 B")
    end)

    it("Should be '1 KB'", function()
        assert.equal(filesize(kilobyte), "1 KB")
    end)

    it("Should be '1 KB'", function()
        assert.equal(filesize(kilobyte, {round = 1}), "1 KB")
    end)

    it("Should be '1KB'", function()
        assert.equal(filesize(kilobyte, {round = 1, spacer = ""}), "1KB")
    end)

    it("Should be '1K'", function()
        assert.equal(filesize(kilobyte, {unix = true}), "1K")
    end)

    it("Should be '8 Kb'", function()
        assert.equal(filesize(kilobyte, {bits  =true}), "8 Kb")
    end)

    it("Should be '8 Kb'", function()
        assert.equal(filesize(kilobyte, {round = 1, bits = true}), "8 Kb")
    end)

    it("Should be '8K'", function()
        assert.equal(filesize(kilobyte, {unix = true, bits = true}), "8K")
    end)

    it("Should be '1024 B'", function()
        assert.equal(filesize(kilobyte, {exponent = 0}), "1024 B")
    end)

    it("Should be '1'", function()
        assert.equal(filesize(kilobyte, {output = "exponent"}), 1)
    end)

    it("Should be '-1 KB'", function()
        assert.equal(filesize(neg), "-1 KB")
    end)

    it("Should be '-1 KB'", function()
        assert.equal(filesize(neg, {round = 1}), "-1 KB")
    end)

    it("Should be '-1KB'", function()
        assert.equal(filesize(neg, {round = 1, spacer = ""}), "-1KB")
    end)

    it("Should be '-1K'", function()
        assert.equal(filesize(neg, {unix = true}), "-1K")
    end)

    it("Should be '-8 Kb'", function()
        assert.equal(filesize(neg, {bits  =true}), "-8 Kb")
    end)

    it("Should be '-8 Kb'", function()
        assert.equal(filesize(neg, {round = 1, bits = true}), "-8 Kb")
    end)

    it("Should be '-8K'", function()
        assert.equal(filesize(neg, {unix = true, bits = true}), "-8K")
    end)

    it("Should be '1 B'", function()
        assert.equal(filesize(byte), "1 B")
    end)

    it("Should be '1 B'", function()
        assert.equal(filesize(byte, {round = 1}), "1 B")
    end)

    it("Should be '1B'", function()
        assert.equal(filesize(byte, {round = 1, spacer = ""}), "1B")
    end)

    it("Should be '1'", function()
        assert.equal(filesize(byte, {unix = true}), "1")
    end)

    it("Should be '8 b'", function()
        assert.equal(filesize(byte, {bits  =true}), "8 b")
    end)

    it("Should be '8 b'", function()
        assert.equal(filesize(byte, {round = 1, bits = true}), "8 b")
    end)

    it("Should be '8'", function()
        assert.equal(filesize(byte, {unix = true, bits = true}), "8")
    end)

    it("Should be '0 B'", function()
        assert.equal(filesize(zero), "0 B")
    end)

    it("Should be '0 B'", function()
        assert.equal(filesize(zero, {round = 1}), "0 B")
    end)

    it("Should be '0B'", function()
        assert.equal(filesize(zero, {round = 1, spacer = ""}), "0B")
    end)

    it("Should be '0'", function()
        assert.equal(filesize(zero, {unix = true}), "0")
    end)

    it("Should be '0 b'", function()
        assert.equal(filesize(zero, {bits  =true}), "0 b")
    end)

    it("Should be '0 b'", function()
        assert.equal(filesize(zero, {round = 1, bits = true}), "0 b")
    end)

    it("Should be '0'", function()
        assert.equal(filesize(zero, {unix = true, bits = true}), "0")
    end)

    it("Should be '500 B'", function()
        assert.equal(filesize(kilobit, {base = 10}), "500 B")
    end)

    it("Should be '500 B'", function()
        assert.equal(filesize(kilobit, {base = 10, round = 1}), "500 B")
    end)

    it("Should be '500B'", function()
        assert.equal(filesize(kilobit, {base = 10, round = 1, spacer = ""}), "500B")
    end)

    it("Should be '500'", function()
        assert.equal(filesize(kilobit, {base = 10, unix = true}), "500")
    end)

    it("Should be '4 kb'", function()
        assert.equal(filesize(kilobit, {base = 10, bits  =true}), "4 kb")
    end)

    it("Should be '4 kb'", function()
        assert.equal(filesize(kilobit, {base = 10, round = 1, bits = true}), "4 kb")
    end)

    it("Should be '4k'", function()
        assert.equal(filesize(kilobit, {base = 10, unix = true, bits = true}), "4k")
    end)

    it("Should be '1.02 kB'", function()
        assert.equal(filesize(kilobyte, {base = 10}), "1.02 kB")
    end)

    it("Should be '1 kB'", function()
        assert.equal(filesize(kilobyte, {base = 10, round = 1}), "1 kB")
    end)

    it("Should be '1kB'", function()
        assert.equal(filesize(kilobyte, {base = 10, round = 1, spacer = ""}), "1kB")
    end)

    it("Should be '1k'", function()
        assert.equal(filesize(kilobyte, {base = 10, unix = true}), "1k")
    end)

    it("Should be '8.19 kb'", function()
        assert.equal(filesize(kilobyte, {base = 10, bits  =true}), "8.19 kb")
    end)

    it("Should be '8.2 kb'", function()
        assert.equal(filesize(kilobyte, {base = 10, round = 1, bits = true}), "8.2 kb")
    end)

    it("Should be '8.2k'", function()
        assert.equal(filesize(kilobyte, {base = 10, unix = true, bits = true}), "8.2k")
    end)

    it("Should be '-1.02 kB'", function()
        assert.equal(filesize(neg, {base = 10}), "-1.02 kB")
    end)

    it("Should be '-1 kB'", function()
        assert.equal(filesize(neg, {base = 10, round = 1}), "-1 kB")
    end)

    it("Should be '-1kB'", function()
        assert.equal(filesize(neg, {base = 10, round = 1, spacer = ""}), "-1kB")
    end)

    it("Should be '-1k'", function()
        assert.equal(filesize(neg, {base = 10, unix = true}), "-1k")
    end)

    it("Should be '-8.19 kb'", function()
        assert.equal(filesize(neg, {base = 10, bits  =true}), "-8.19 kb")
    end)

    it("Should be '-8.2 kb'", function()
        assert.equal(filesize(neg, {base = 10, round = 1, bits = true}), "-8.2 kb")
    end)

    it("Should be '-8.2k'", function()
        assert.equal(filesize(neg, {base = 10, unix = true, bits = true}), "-8.2k")
    end)

    it("Should be '1 B'", function()
        assert.equal(filesize(byte, {base = 10}), "1 B")
    end)

    it("Should be '1 B'", function()
        assert.equal(filesize(byte, {base = 10, round = 1}), "1 B")
    end)

    it("Should be '1B'", function()
        assert.equal(filesize(byte, {base = 10, round = 1, spacer = ""}), "1B")
    end)

    it("Should be '1'", function()
        assert.equal(filesize(byte, {base = 10, unix = true}), "1")
    end)

    it("Should be '8 b'", function()
        assert.equal(filesize(byte, {base = 10, bits  =true}), "8 b")
    end)

    it("Should be '8 b'", function()
        assert.equal(filesize(byte, {base = 10, round = 1, bits = true}), "8 b")
    end)

    it("Should be '8'", function()
        assert.equal(filesize(byte, {base = 10, unix = true, bits = true}), "8")
    end)

    it("Should be '0 B'", function()
        assert.equal(filesize(zero, {base = 10}), "0 B")
    end)

    it("Should be '0 B'", function()
        assert.equal(filesize(zero, {base = 10, round = 1}), "0 B")
    end)

    it("Should be '0B'", function()
        assert.equal(filesize(zero, {base = 10, round = 1, spacer = ""}), "0B")
    end)

    it("Should be '0'", function()
        assert.equal(filesize(zero, {base = 10, unix = true}), "0")
    end)

    it("Should be '0 b'", function()
        assert.equal(filesize(zero, {base = 10, bits  =true}), "0 b")
    end)

    it("Should be '0 b'", function()
        assert.equal(filesize(zero, {base = 10, round = 1, bits = true}), "0 b")
    end)

    it("Should be '0'", function()
        assert.equal(filesize(zero, {base = 10, unix = true, bits = true}), "0")
    end)

    it("Should be '1 Б'", function()
        assert.equal(filesize(byte, {suffixes = {B = "Б"}}), "1 Б")
    end)

    it("Should be '1 KB'", function()
        assert.equal(filesize(kilobyte, {suffixes = {B = "Б"}}), "1 KB")
    end)

end)
