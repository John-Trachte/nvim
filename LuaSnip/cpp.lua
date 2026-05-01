-- luasnip.lua
-- https://www.youtube.com/watch?v=FmHhonPjvvA

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node


ls.add_snippets("cpp", {
    s("cout", {
        t('std::cout << '),
        i(1),
        t(';')
    }),
    
    s("cin", {
        t('std::cin >> '),
        i(1),
        t(';')
    }),

    s("main", {
        t({'int main()',
        '{',
        '    '}),
        i(1),
        t({'  ',
        '    return 0;',
        '}'}),
    }),

    s("std", {
        t('std::')
    }),

    s("<ios", {
        t('<iostream>')
    }),

    s("ios", {
        t('<iostream>')
    }),

    s("#inc", {
        t('#include ')
    }),

    s("inc", {
        t('#include ')
    }),

    s("mun", {
        t('[[maybe_unused]] ')
    }),

    s("forr", {
        t('for(auto '),
        i(1),
        t(' : '),
        i(2),
        t({')', '{', '    ',}),
        i(3),
        t({' ', '}',}),
    }),
})
