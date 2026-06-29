-- handles basic stuff, loads in assets, settings, sets up the window and loads in other essential system files like the terminal and app loader
function love.load()
    require("terminal")
    require("apploader")
    
    -- state variables
    state = {
        current = "startup"
        canEsc = true
    }
    
    
    local cr_data = love.image.newImageData("m_assets/cursors/hand.png")
    cursor = love.mouse.newCursor(cr_data, 4, 1)
    love.mouse.setCursor(cursor)

    local defaultFont = love.graphics.newFont("m_assets/fonts/W95F.otf", 23)
    love.graphics.setFont(defaultFont)

    -- set up sfx
    sounds = {
        startup = love.audio.newSource("m_sound/m_sfx/startup.mp3", "static"),
        openApp = love.audio.newSource("m_sound/m_sfx/openapp.mp3", "static"),
        closeApp = love.audio.newSource("m_sound/m_sfx/closeapp.mp3", "static"),
        notif = love.audio.newSource("m_sound/m_sfx/notif.mp3", "static"),
        crash = love.audio.newSource("m_sound/m_sfx/crashsound.mp3", "static"),
    }
end

function love.update(dt)
    
end

function love.keypressed(key)
    if key == "escape" then
        if state.canEsc == true then
            love.event.quit()
        end
    end
end