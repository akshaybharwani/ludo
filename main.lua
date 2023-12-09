Class = require "libraries.class"

-- constants.. why doesn't <const> work?
l = love
lg = l.graphics

SCREEN_HEIGHT = 1280
SCREEN_WIDTH = 720

local boardSize = 700
local playerIslandSize = boardSize/3
local playerMovementSize = playerIslandSize/3
local movementBlock = playerIslandSize/6
local boardX
local boardY

local playerRadius = 15
local dice

local function drawPlayerIslands()
    -- playerIslands
    lg.setColor(1, 0, 1)
    lg.rectangle("fill", boardX, boardY, playerIslandSize, playerIslandSize)
    lg.rectangle("fill", boardX + playerIslandSize * 2, boardY, playerIslandSize, playerIslandSize)
    lg.rectangle("fill", boardX, boardY + playerIslandSize * 2, playerIslandSize, playerIslandSize)
    lg.rectangle("fill", boardX + playerIslandSize * 2, boardY + playerIslandSize * 2, playerIslandSize, playerIslandSize)
    lg.rectangle("fill", boardX + playerIslandSize, boardY + playerIslandSize, playerIslandSize, playerIslandSize)
end

local function drawMovementBlocks()
    -- playerMovementIslands
    lg.setColor(0, 1, 1)
    for i = 0, 2 do
        lg.rectangle("line", boardX, boardY + playerIslandSize + playerMovementSize * i, playerIslandSize, playerMovementSize) 
        lg.rectangle("line", boardX + playerIslandSize * 2, boardY + playerIslandSize + playerMovementSize * i, playerIslandSize, playerMovementSize) 
        lg.rectangle("line", boardX + playerIslandSize + playerMovementSize * i, boardY, playerMovementSize, playerIslandSize) 
        lg.rectangle("line", boardX + playerIslandSize + playerMovementSize * i, boardY + playerIslandSize * 2, playerMovementSize, playerIslandSize) 
    end
    -- movementBlocks
    for i = 0, 5 do
        lg.rectangle("line", boardX + playerIslandSize, boardY + movementBlock * i, playerIslandSize, movementBlock)
        lg.rectangle("line", boardX + playerIslandSize, boardY + playerIslandSize * 2 + movementBlock * i, playerIslandSize, movementBlock)
        lg.rectangle("line", boardX + movementBlock * i, boardY + playerIslandSize, movementBlock, playerIslandSize)
        lg.rectangle("line", boardX + playerIslandSize * 2 + movementBlock * i, boardY + playerIslandSize, movementBlock, playerIslandSize)
    end
end

local function drawPlayers()
    lg.setColor(1, 0, 0)
    for i = 0, 2, 2 do
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
    end    
end

function love.load()
    local modules = {
        'dice'
    }
    for k,r in ipairs(modules) do
		require ('' .. r)
	end
    --love.window.setFullscreen(true)
    SCREEN_WIDTH, SCREEN_HEIGHT = lg.getDimensions()
    boardX = SCREEN_WIDTH/2 - boardSize/2
    boardY = SCREEN_HEIGHT/2 - boardSize/2
    math.randomseed(os.time())
    dice = Dice()
end

function love.update()

end

function love.draw()
    lg.setColor(1, 1, 1)
    lg.rectangle("fill", boardX, boardY, boardSize, boardSize)
    drawPlayerIslands()
    drawMovementBlocks()
    drawPlayers()
    dice:draw()
end

function l.mousepressed(x, y, button, istouch)
    if button == 1 and x >= dice.x and x < dice.x + dice.width and y >= dice.y and y < dice.y + dice.height then
        dice:rollDice()
    end
end



