-- handles basic stuff, loads in assets, settings, sets up the window ad loads in other essential system files like the terminal and app loader

function love.load()
    -- controls the state of the program
    state = "startup"

    canEsc = true
   -
    love.window.setFullscreen(false)
    
    love.graphics.newImage("m_assets/hand.png")
    local cr_data = love.image.newImageData("m_assets/hand.png")
    cursor = love.mouse.newCursor(cr_data, 4, 1)
    love.mouse.setCursor(cursor)

    local defaultFont = love.graphics.newFont("fonts/W95F.otf", 16)
    love.graphics.setFont(defaultFont)

    love.window.setIcon(love.image.newImageData("m_assets/playIcon.png"))
    love.window.setTitle("playground test window")
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.setBackgroundColor(0.945, 0.910, 0.835)
    love.graphics.setColor(0, 0, 0)
    love.graphics.print("press ESC to end the program", 0, 0)
end

function love.keypressed(key)
    if key == "escape" then
        if canEsc == true then
            love.event.quit()
        end
    end
end