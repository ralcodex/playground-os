-- terminal's code. VERY EARLY WIP
-- I DONT KNOW WHAT IM DOING SO THIS MAY BE VERY BROKEN/BUGGY
-- just gonna assume i start this off with a table lmao

require("m_system.apploader")

cantype = false


local terminal = {
    history = {},
    input = "",
}

local commands = {
    -- I DONT KNOW WHAT IM DOING HERE but i guess commands will go here???
    clear = function()
        terminal.history = {}
    end,

    echo = function(args)
        table.insert(terminal.history, table.concat(args, " "))
    end,

    playversion = function()
        table.insert(terminal.history, "playground-os pre alpha v1")
    end,
}