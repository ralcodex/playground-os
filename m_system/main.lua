-- handles basic stuff, loads in assets, settings, sets up the window ad loads in other essential system files like the terminal and app loader

function love.load()
    -- state variables
    state = "startup"
    canEsc = true
    
    -- set up the window
    love.window.setMode(800, 600, {resizable=true})
    love.window.setFullscreen(false)
    love.window.setIcon(love.image.newImageData("m_assets/playIcon.png"))
    love.window.setTitle("playgroundtest")
    
    local cr_data = love.image.newImageData("m_assets/hand.png")
    cursor = love.mouse.newCursor(cr_data, 4, 1)
    love.mouse.setCursor(cursor)

    local defaultFont = love.graphics.newFont("fonts/W95F.otf", 23)
    love.graphics.setFont(defaultFont)

    -- load in audio files
    startSound = love.audio.newSource("m_sfx/startsound.mp3", "static")
    openAppSound = love.audio.newSource("m_sfx/openapp.mp3", "static")
    closeAppSound = love.audio.newSource("m_sfx/closeapp.mp3", "static")
    notifSound = love.audio.newSource("m_sfx/notif.mp3", "static")
    crashSound = love.audio.newSource("m_sfx/crashsound.mp3", "static")

    function loadTerminal() -- load in terminal file for later
        require("m_system.terminal")
    end
    
    function startup()
        -- play the startup sound
        love.audio.play(startSound)
        -- wait for the sound to finish before changing the state
        love.timer.sleep(3)
        state = "desktop"
    end

end

function love.update(dt)
    if state == "startup" then
        startup()
    end
end

function love.draw()
    love.graphics.setBackgroundColor(1, 1, 0, 1)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("playground-os test window", 0, 0)
    love.graphics.print("press ESC to end the program", 0, 25)
end

function love.keypressed(key)
    if key == "escape" then
        if canEsc == true then
            love.event.quit()
        end
    end
end
