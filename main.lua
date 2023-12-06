local height = 1280
local width = 720

function love.load()
	--love.window.setMode(GAME_WIDTH, GAME_HEIGHT, {fullscreen=false, minwidth=1280, minheight=720})
    --love.window.setFullscreen(true)
    width, height = love.graphics.getDimensions()
end

function love.update()
    
end

function love.draw()
    love.graphics.rectangle("fill", 40, 40, width - 80, height - 80)
end