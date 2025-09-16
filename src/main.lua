require("classes.classes")

function love.load()
    math.randomseed(os.time())
    
    tileSize = 20
    newTileType({name="stone", color={0.2,0.2,0.2}})
    newTileType({name="grass", color={0.2,1,0.2}})
    newTileType({name="water", color={0.2,0.2,1}})
    
    worldSize = 20
    world = {}
    for x = 0, worldSize do
        world[x] = {}
        for y = 0, worldSize do
            world[x][y] = tile.new({
                x = x,
                y = y,
                type = getRandomTileType(),
                tileSize = tileSize
            })
        end 
    end
end

function love.update(dt)
end

function love.draw()
    for x = 0, worldSize do
        for y = 0, worldSize do
            world[x][y]:draw()
        end 
    end
end