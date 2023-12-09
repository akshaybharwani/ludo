Class = require "libraries.class"
Timer = require "libraries.timer"

-- constants.. why doesn't <const> work?
l = love
lg = l.graphics

SCREEN_HEIGHT = 1280
SCREEN_WIDTH = 720

BOARD_SIZE = 700

BOARD_X = 0
BOARD_Y = 0

local dice
local playerManager

local function drawPlayers()
    lg.setColor(1, 0, 0)
    --[[ for i = 0, 2, 2 do
        -- top
        lg.circle("fill", boardX + playerIslandSize * i + playerMovementSize, boardY + playerMovementSize, playerRadius)
        lg.circle("fill", boardX + playerIslandSize * i + playerMovementSize * 2, boardY + playerMovementSize, playerRadius)
        lg.circle("fill", boardX + playerIslandSize * i + playerMovementSize, boardY + playerMovementSize * 2, playerRadius)
        lg.circle("fill", boardX + playerIslandSize * i + playerMovementSize * 2, boardY + playerMovementSize * 2, playerRadius)

        -- bottom
        lg.circle("fill", boardX + playerIslandSize * i + playerMovementSize, boardY + playerIslandSize * 2 + playerMovementSize, playerRadius)
        lg.circle("fill", boardX + playerIslandSize * i + playerMovementSize * 2, boardY + playerIslandSize * 2 + playerMovementSize * 2, playerRadius)
        lg.circle("fill", boardX + playerIslandSize * i + playerMovementSize, boardY + playerIslandSize * 2 + playerMovementSize * 2, playerRadius)
        lg.circle("fill", boardX + playerIslandSize * i + playerMovementSize * 2, boardY + playerIslandSize * 2 + playerMovementSize, playerRadius)
    end ]]
end

function love.load()
    local modules = {
        'dice',
        'playerManager',
        'player'
    }
    for k,r in ipairs(modules) do
		require ('' .. r)
	end
    --love.window.setFullscreen(true)
    SCREEN_WIDTH, SCREEN_HEIGHT = lg.getDimensions()
    BOARD_X = SCREEN_WIDTH/2 - BOARD_SIZE/2
    BOARD_Y = SCREEN_HEIGHT/2 - BOARD_SIZE/2
    dice = Dice()
    playerManager = PlayerManager(1)
end

function love.update(dt)
    Timer.update(dt)
end

function love.draw()
    lg.setColor(1, 1, 1)
    lg.rectangle("fill", BOARD_X, BOARD_Y, BOARD_SIZE, BOARD_SIZE)
    drawPlayers()
    dice:draw()
    playerManager:draw()
end

function l.mousepressed(x, y, button, istouch)
    if button == 1 and x >= dice.x and x < dice.x + dice.width and y >= dice.y and y < dice.y + dice.height then
        dice:rollDice()
    end
end



