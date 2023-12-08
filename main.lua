-- constants.. why doesn't <const> work?
local l = love
local lg = l.graphics

local height = 1280
local width = 720

local boardSize = 700
local playerIslandSize = boardSize/3
local playerMovementSize = playerIslandSize/3
local movementBlock = playerIslandSize/6
local halfBoardWidth
local halfBoardHeight

local playerRadius = 20

function love.load()
    --love.window.setFullscreen(true)
    width, height = lg.getDimensions()
    halfBoardWidth = width/2 - boardSize/2
    halfBoardHeight = height/2 - boardSize/2
end

function love.update()

end

local function drawPlayerIslands()
    -- playerIslands
    lg.setColor(1, 0, 1)
    lg.rectangle("fill", halfBoardWidth, halfBoardHeight, playerIslandSize, playerIslandSize)
    lg.rectangle("fill", halfBoardWidth + playerIslandSize * 2, halfBoardHeight, playerIslandSize, playerIslandSize)
    lg.rectangle("fill", halfBoardWidth, halfBoardHeight + playerIslandSize * 2, playerIslandSize, playerIslandSize)
    lg.rectangle("fill", halfBoardWidth + playerIslandSize * 2, halfBoardHeight + playerIslandSize * 2, playerIslandSize, playerIslandSize)
    lg.rectangle("fill", halfBoardWidth + playerIslandSize, halfBoardHeight + playerIslandSize, playerIslandSize, playerIslandSize)
end

local function drawMovementBlocks()
    -- playerMovementIslands
    lg.setColor(0, 1, 1)
    for i = 0, 2 do
        lg.rectangle("line", halfBoardWidth, halfBoardHeight + playerIslandSize + playerMovementSize * i, playerIslandSize, playerMovementSize) 
        lg.rectangle("line", halfBoardWidth + playerIslandSize * 2, halfBoardHeight + playerIslandSize + playerMovementSize * i, playerIslandSize, playerMovementSize) 
        lg.rectangle("line", halfBoardWidth + playerIslandSize + playerMovementSize * i, halfBoardHeight, playerMovementSize, playerIslandSize) 
        lg.rectangle("line", halfBoardWidth + playerIslandSize + playerMovementSize * i, halfBoardHeight + playerIslandSize * 2, playerMovementSize, playerIslandSize) 
    end
    -- movementBlocks
    for i = 0, 5 do
        lg.rectangle("line", halfBoardWidth + playerIslandSize, halfBoardHeight + movementBlock * i, playerIslandSize, movementBlock)
        lg.rectangle("line", halfBoardWidth + playerIslandSize, halfBoardHeight + playerIslandSize * 2 + movementBlock * i, playerIslandSize, movementBlock)
        lg.rectangle("line", halfBoardWidth + movementBlock * i, halfBoardHeight + playerIslandSize, movementBlock, playerIslandSize)
        lg.rectangle("line", halfBoardWidth + playerIslandSize * 2 + movementBlock * i, halfBoardHeight + playerIslandSize, movementBlock, playerIslandSize)
    end
end

local function drawPlayers()
    lg.setColor(1, 0, 0)
    for i = 0, 2, 2 do
        -- top
        lg.circle("fill", halfBoardWidth + playerIslandSize * i + playerMovementSize, halfBoardWidth + playerMovementSize / 2, playerRadius)
        lg.circle("fill", halfBoardWidth + playerIslandSize * i + playerMovementSize * 2, halfBoardWidth + playerMovementSize / 2, playerRadius)
        lg.circle("fill", halfBoardWidth + playerIslandSize * i + playerMovementSize, halfBoardWidth + playerMovementSize * 2, playerRadius)
        lg.circle("fill", halfBoardWidth + playerIslandSize * i + playerMovementSize * 2, halfBoardWidth + playerMovementSize * 2, playerRadius)

        -- bottom
        lg.circle("fill", halfBoardWidth + playerIslandSize * i + playerMovementSize, halfBoardWidth + playerIslandSize * 2 + playerMovementSize / 2, playerRadius)
        lg.circle("fill", halfBoardWidth + playerIslandSize * i + playerMovementSize * 2, halfBoardWidth + playerIslandSize * 2 + playerMovementSize * 2, playerRadius)
        lg.circle("fill", halfBoardWidth + playerIslandSize * i + playerMovementSize, halfBoardWidth + playerIslandSize * 2 + playerMovementSize * 2, playerRadius)
        lg.circle("fill", halfBoardWidth + playerIslandSize * i + playerMovementSize * 2, halfBoardWidth + playerIslandSize * 2 + playerMovementSize / 2, playerRadius)
    end    
end

function love.draw()
    lg.setColor(1, 1, 1)
    lg.rectangle("fill", halfBoardWidth, halfBoardHeight, boardSize, boardSize)
    drawPlayerIslands()
    drawMovementBlocks()
    drawPlayers()
end



