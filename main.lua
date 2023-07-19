DBG = require 'debugger'
push = require 'push'
TILE_SIZE = 11
FONT_SIZE = 16
GAME_WIDTH = TILE_SIZE * 80
GAME_HEIGHT = TILE_SIZE * 50
WINDOW_WIDTH = GAME_WIDTH * 1.5
WINDOW_HEIGHT = GAME_HEIGHT * 1.5
function love.load()
    -- local font = love.graphics.newFont("VictorMono-Regular.ttf", 24)
    font = love.graphics.newFont("ibm.ttf", FONT_SIZE)
    love.graphics.setFont(font)
    -- DBG()
    love.graphics.setDefaultFilter("nearest", "nearest")
    push:setupScreen(
        GAME_WIDTH,
        GAME_HEIGHT,
        WINDOW_WIDTH,
        WINDOW_HEIGHT,
        { vsync = true, fullscreen = false, resizable = true }
    )
    player = { x = 10, y = 10 }
end

function love.draw()
    push:start()
    for i = 1, 80 do
        love.graphics.print("#", TILE_SIZE * (i - 1), 0)
        love.graphics.print("#", TILE_SIZE * (i - 1), GAME_HEIGHT - TILE_SIZE)
    end

    love.graphics.setColor(0.1, 0.3, 0.2)
    for y = 1, 48 do
        for x = 0, 79 do
            love.graphics.print("W", TILE_SIZE * x, TILE_SIZE * y)
        end
    end
    love.graphics.setColor(1, 1, 0)
    love.graphics.print("@", player.x * TILE_SIZE, player.y * TILE_SIZE)
    push:finish()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function love.resize(w, h)
    push:resize(w, h)
end
