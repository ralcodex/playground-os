-- terminal's code. VERY EARLY WIP
-- I DONT KNOW WHAT IM DOING SO THIS MAY BE VERY BROKEN/BUGGY

require("apploader")
cantype = false

local terminal = {
    history = {},
    input = "",
}

function love.textinput(t)
    if cantype then
        terminal.input = terminal.input .. t
    end
end

local commands = {
    -- I DONT KNOW WHAT IM DOING HERE but i guess commands will go here???
    clear = function()
        terminal.history = {}
    end,

    echo = function(args)
        table.insert(terminal.history, table.concat(args, " "))
    end,

    getversion = function()
        table.insert(terminal.history, "playground-os pre alpha v2")
    end,

    list = function()
        table.insert(terminal.history, "Type 'list' for command list")
        table.insert(terminal.history, "Type 'clear' to clear the terminal")
        table.insert(terminal.history, "Type 'echo' to repeat text")
        table.insert(terminal.history, "Type 'getversion' to see your current system version")
    end
}

table.insert(terminal.history, "terminal test")

function love.draw()
    love.graphics.setBackgroundColor(0, 0.3, 0.5)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("press 'ESC' to end the program", 0, 0)
    love.graphics.print(terminal.history)
end