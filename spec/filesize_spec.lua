-- lua-filesize, generate a human readable string describing the file size
-- Copyright (c) 2016 Boris Nagaev
-- See the LICENSE file for terms of use.

local filesize = require 'filesize'

describe("examples from main page of http://filesizejs.com/", function()
    it("returns 500 B for 500", function()
        assert.equal("500 B", filesize(500))
    end)

    it("returns 4 kb for 500 bits", function()
        assert.equal("4 kb", filesize(500, {bits = true}))
    end)

    it("returns 259.1 kB for 265318", function()
        assert.equal("259.1 kB", filesize(265318))
    end)

    it("returns 265.32 kB for 265318, base=10", function()
        assert.equal("265.32 kB", filesize(265318, {base = 10}))
    end)

    it("returns 259 kB for 265318, round=0", function()
        assert.equal("259 kB", filesize(265318, {round = 0}))
    end)

    it("returns {259.1, 'kB'} for 265318, output=array", function()
        assert.same({259.1, "kB"}, filesize(265318, {output = "array"}))
    end)

    it("returns {value=259.1, suffix='kB'} for 265318, output=object",
    function()
        assert.same(
            {value=259.1, suffix="kB"},
            filesize(265318, {output = "object"})
        )
    end)

    it("returns 1 Б for 1, Russian suffixes", function()
        assert.equal("1 Б", filesize(1, {suffixes = {B = "Б"}}))
    end)

    it("returns 1 kB for 1024", function()
        assert.equal("1 kB", filesize(1024))
    end)

    it("returns 1024 B for 1024, exponent=0", function()
        assert.equal("1024 B", filesize(1024, {exponent = 0}))
    end)

    it("returns 1 for 1024, output=exponent", function()
        assert.equal(1, filesize(1024, {output = "exponent"}))
    end)
end)
