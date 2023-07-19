DBG = require 'debugger'
push = require 'push'
GAME_WIDTH = 1280
GAME_HEIGHT = 800
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 800
TILE_SIZE = 16
FONT_SIZE = 20
function love.load()
    -- local font = love.graphics.newFont("VictorMono-Regular.ttf", 24)
    font = love.graphics.newFont("dos.ttf", FONT_SIZE)
    love.graphics.setFont(font)
    DBG()
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
        love.graphics.print("#", TILE_SIZE * (i - 1), WINDOW_HEIGHT - TILE_SIZE)
    end

    love.graphics.setColor(0.1, 0.3, 0.2)
    for y = 0, 49 do
        for x = 0, 79 do
            love.graphics.print(".", TILE_SIZE * x, TILE_SIZE * y)
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
