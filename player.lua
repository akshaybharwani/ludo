Player = Class {
    init = function (self, id, playerMovementSize)
        self.id = id
        self.tokenRadius = 15

        self.token1 = {x = BOARD_X + playerMovementSize, y = BOARD_Y + playerMovementSize }
        self.token2 = {x = BOARD_X + playerMovementSize * 2, y = BOARD_Y + playerMovementSize }
        self.token3 = {x = BOARD_X + playerMovementSize, y = BOARD_Y + playerMovementSize * 2 }
        self.token4 = {x = BOARD_X + playerMovementSize * 2, y = BOARD_Y + playerMovementSize * 2 }
        --Timer.tween(1, self.token1, {x = BOARD_X + playerMovementSize + 200}, 'in-out-quad')
    end,

    draw = function (self)
        lg.circle("fill", self.token1.x, self.token1.y, self.tokenRadius)
        lg.circle("fill", self.token2.x, self.token2.y, self.tokenRadius)
        lg.circle("fill", self.token3.x, self.token3.y, self.tokenRadius)
        lg.circle("fill", self.token4.x, self.token4.y, self.tokenRadius)
    end
}