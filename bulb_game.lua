require("class")
require("bulb_map")

-- init function
-- when initialized from bulbasaur_game_scene, automatically given access to self var

BulbGame = class(function(c, width, height)
    c.width = width
    c.height = height
    c.map = nil
end)

-- explicit create function, creates and display

function BulbGame:create(group)
    local rows = 4
    local size = self.height/rows
    local mapWidth = self.width/5*4
    --local columns = math.floor(mathWidth/size)

    self.map = BulbMap(self.width, self.height, rows)
    self.map:create(group)
end

function BulbGame:removeSelf(group)
    if(self.map) then
        self.map:removeSelf()
    end
end
