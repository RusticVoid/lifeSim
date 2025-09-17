require("classes.classes")

function love.load()
    math.randomseed(os.clock())
    
    newTileType({name="stone", color={0.2,0.2,0.2}})
    newTileType({name="grass", color={0,1,0}})
    newTileType({name="water", color={0,0,1}})
    newTileType({name="sand", color={1,1,0}})
    
    tileSize = 5
    world = world.new({width = 150, height = 100, smoothness = 10})
end

function love.update(dt)
end

function love.draw()
    for x = 0, world.width do
        for y = 0, world.height do
            world.data[x][y]:draw()
        end
    end
end