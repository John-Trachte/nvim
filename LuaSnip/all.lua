-- luasnip.lua
-- https://www.youtube.com/watch?v=FmHhonPjvvA

local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

vim.keymap.set( "i", "<C-o>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set( "i", "<C-i>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })


ls.add_snippets("all", {
    s("cheq", { 
        t('#import \"@preview/cheq:0.3.0\": checklist') 
    }),
    
    s("zap", {
        t('#import \"@preview/zap:0.4.0\"') 
    }),

    s("lilaq", {
        t({ "#import \"@preview/lilaq:0.6.0\" as lq", "#show: lq.theme.schoolbook"}) 
    }),

    s("alr", {
        t({'#align(right)[','    '}),
        i(1),
        t({'',']'}),
    }),

    s("all", {
        t({'#align(left)[','    '}),
        i(1),
        t({'',']'}),
    }),

    s("alc", {
        t({'#align(center)[','    '}),
        i(1),
        t({'',']'}),
    }),

    s("smc", {
        t('#smallcaps['),
        i(1),
        t(']'),
    }),

    s("par", {
        t('#par(first-line-indent: (amount: '),
        i(1),
        t('em, all: '),
        i(2, "true"),
        t({'),','[','    '}),
        i(3),
        t({'','])'}),
    }),

    -- ew what
    s("table", {
        t({'#table(',
        '    columns: (auto, auto'}),
        i(1),
        t({'),',
        '    align: center,',
        '    table.header(', 
        '        [_'}),
        i(2),
        t('_], [_'),
        i(3),
        t('_],'),
        i(4),
        t({'','        ['}),
        i(5),
        t({'], [',}),
        i(6),
        t(']'),
        i(7),
        t({'','    )',')'}),
    }),

    s("date", {
        t("#datetime.today().display(\"[month repr:long]\") #datetime.today().day(), #datetime.today().year()") 
    }),

    s("uf", {
        t('#sym.mu\\F')
    }),

    s("img", {
        t('#image("')
    }),

    s("linv", {
        t('cal(L)^(-1){'),
    }),
    
    s("lapl", {
        t('cal(L){'),
    }),

    s("grid", {
        t({'#grid(',
        '    columns: (2fr, 2fr'}),
        i(1),
        t({'),',
        '    [',
        '        '}),
        i(2),
        t({'','    ],',
        '    [','        '}),
        i(3),
        t({'','    ]',')'})
    }),

    s("block", {
        t('#block(inset: '),
        i(1),
        t({'em)[',
        '    '}),
        i(2),
        t({'',']'}),
    }),
})
