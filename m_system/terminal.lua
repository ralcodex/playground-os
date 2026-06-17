-- terminal's code. VERY EARLY WIP
-- I DONT KNOW WHAT IM DOING SO THIS MAY BE VERY BROKEN/BUGGY

require("apploader")
cantype = true
testvar = ""

local terminal = {
    history = {},
    input = "",
}

-- i'm assuming this is how text input works in love2d...
-- i dont really know, the auto-completer wrote this function and it works, soooo...
function love.textinput(t) 
    if cantype then
        terminal.input = terminal.input .. t
    end
end

function love.keypressed(key) -- clear input after pressing enter
    if key == "enter" then
        testvar = terminal.input
        terminal.input = "" 
        if testvar == "getversion" then 
            table.insert(terminal.history, "playground-os pre alpha v2.1")
        end
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
        table.insert(terminal.history, "playground-os pre alpha v2.1")
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
    love.graphics.setBackgroundColor(0, 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("> " .. terminal.input, 10, love.graphics.getHeight() - 30) -- input line
end