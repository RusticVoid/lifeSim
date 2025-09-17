world = {}
world.__index = world
function world.new(settings)
    local self = setmetatable({}, world)

    self.width = settings.width
    self.height = settings.height
    self.data = {}

    self.smoothIteration = settings.smoothness

    for x = 0, self.width do
        self.data[x] = {}
        for y = 0, self.height do
            self.data[x][y] = tile.new({
                x = x,
                y = y,
                type = tileTypes.water,
                tileSize = tileSize,
                height = math.random(0, 1)
            })
        end
    end
    
    self:smooth()

    for x = 0, self.width do
        for y = 0, self.height do
            if self.data[x][y].height > 0.5 then
                self.data[x][y].height = 1
            else
                self.data[x][y].height = 0
            end
        end
    end

    self:smooth()

    for x = 0, self.width do
        for y = 0, self.height do
            if (self.data[x][y].height > 0.35) then
                self.data[x][y].type = tileTypes.sand
            end

            if (self.data[x][y].height > 0.5) then
                self.data[x][y].type = tileTypes.grass
            end
            
            if (self.data[x][y].height > 0.9) then
                self.data[x][y].type = tileTypes.stone
            end
        end
    end

    return self
end

function world:smooth()
    for i = 0, self.smoothIteration do
        self.changedData = self.data
        for x = 0, self.width do
            for y = 0, self.height do
                local num1 = 0
                local num2 = 0
                local num3 = 0
                local num4 = 0
                if (y+1 <= self.height) then
                    num1 = self.changedData[x][y+1].height
                end
                if (y-1 >= 0) then
                    num2 = self.changedData[x][y-1].height
                end
                if (x+1 <= self.width) then
                    num3 = self.changedData[x+1][y].height
                end
                if (x-1 >= 0) then
                    num4 = self.changedData[x-1][y].height
                end
                self.data[x][y].height = (num1+num2+num3+num4)/4
            end
        end
    end
end