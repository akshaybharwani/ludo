Dice = Class {
    size = 40,
    roll = 1,

    init = function (self)
        self.rollFont = lg.newFont(self.size)
        self.height = self.rollFont:getHeight()
        self.rollString = tostring(self.roll)
        self.width = self.rollFont:getWidth(self.rollString)
        self.x = SCREEN_WIDTH / 2 - self.width / 2
        self.y = SCREEN_HEIGHT - 200
    end,

    draw = function (self)
        self.rollString = tostring(self.roll)
        lg.setFont(self.rollFont)
        lg.print(self.rollString, self.x, self.y)
    end
}

function Dice:rollDice()
    self.roll = math.random(1, 6)
    return self.roll
end