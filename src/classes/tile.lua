tileTypes = {}
function newTileType(settings)
    tileTypes[settings.name] = settings.color
end

function getRandomTileType()
    local keys = {}
    for k in pairs(tileTypes) do
        table.insert(keys, k)
    end
    local randomKey = keys[math.random(#keys)]

    return tileTypes[randomKey]
end

tile = {}
tile.__index = tile
function tile.new(settings)
    local self = setmetatable({}, tile)

    self.tileSize = settings.tileSize

    self.x = settings.x
    self.y = settings.y

    self.type = settings.type

    self.color = settings.type

    return self
end

function tile:draw()
    love.graphics.setColor(self.color)
    love.graphics.rectangle("fill",self.x*self.tileSize,self.y*self.tileSize,self.tileSize,self.tileSize)
end