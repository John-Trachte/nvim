-- luasnip.lua
-- https://www.youtube.com/watch?v=FmHhonPjvvA

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


ls.add_snippets("c", {
    s("avr inc", {
        t({ '#include <avr/io.h>', '#include <util/delay.h>', '#include <stdint.h>', '' }),
    }),

    s("main", {
        t({'int main(void)','{','    '}),
        i(1),
        t({'    ','    return 0;','}'}),
    }),
})
