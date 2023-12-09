PlayerManager = Class {
    init = function (self, noOfPlayers)
        self.playerIslandSize = BOARD_SIZE / 3
        self.playerMovementSize = self.playerIslandSize / 3
        self.movementBlock = self.playerIslandSize / 6

        self.player1 = Player(1, self.playerMovementSize)
    end,

    draw = function (self)
        self:drawPlayerIslands()
        self:drawMovementBlocks()
        self.player1:draw()
    end
}

function PlayerManager:drawPlayerIslands()
    -- playerIslands
    lg.setColor(1, 0, 1)
    lg.rectangle("fill", BOARD_X, BOARD_Y, self.playerIslandSize, self.playerIslandSize)
    lg.rectangle("fill", BOARD_X + self.playerIslandSize * 2, BOARD_Y, self.playerIslandSize, self.playerIslandSize)
    lg.rectangle("fill", BOARD_X, BOARD_Y + self.playerIslandSize * 2, self.playerIslandSize, self.playerIslandSize)
    lg.rectangle("fill", BOARD_X + self.playerIslandSize * 2, BOARD_Y + self.playerIslandSize * 2, self.playerIslandSize, self.playerIslandSize)
    lg.rectangle("fill", BOARD_X + self.playerIslandSize, BOARD_Y + self.playerIslandSize, self.playerIslandSize, self.playerIslandSize)
end

function PlayerManager:drawMovementBlocks()
    -- playerMovementIslands
    lg.setColor(0, 1, 1)
    for i = 0, 2 do
        lg.rectangle("line", BOARD_X, BOARD_Y + self.playerIslandSize + self.playerMovementSize * i, self.playerIslandSize, self.playerMovementSize) 
        lg.rectangle("line", BOARD_X + self.playerIslandSize * 2, BOARD_Y + self.playerIslandSize + self.playerMovementSize * i, self.playerIslandSize, self.playerMovementSize) 
        lg.rectangle("line", BOARD_X + self.playerIslandSize + self.playerMovementSize * i, BOARD_Y, self.playerMovementSize, self.playerIslandSize) 
        lg.rectangle("line", BOARD_X + self.playerIslandSize + self.playerMovementSize * i, BOARD_Y + self.playerIslandSize * 2, self.playerMovementSize, self.playerIslandSize) 
    end
    -- movementBlocks
    for i = 0, 5 do
        lg.rectangle("line", BOARD_X + self.playerIslandSize, BOARD_Y + self.movementBlock * i, self.playerIslandSize, self.movementBlock)
        lg.rectangle("line", BOARD_X + self.playerIslandSize, BOARD_Y + self.playerIslandSize * 2 + self.movementBlock * i, self.playerIslandSize, self.movementBlock)
        lg.rectangle("line", BOARD_X + self.movementBlock * i, BOARD_Y + self.playerIslandSize, self.movementBlock, self.playerIslandSize)
        lg.rectangle("line", BOARD_X + self.playerIslandSize * 2 + self.movementBlock * i, BOARD_Y + self.playerIslandSize, self.movementBlock, self.playerIslandSize)
    end
end