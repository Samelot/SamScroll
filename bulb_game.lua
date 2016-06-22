require("class")
require("bulb_map")
require("bulb_inventory")

-- init function
-- when initialized from bulbasaur_game_scene, automatically given access to self var

BulbGame = class(function(c, width, height)
    c.width = width
    c.height = height
    c.map = nil
    c.inventory = nil
    c.state = "nothing"
    c.selectedPlant = nil
end)

-- explicit create function, creates and display

function BulbGame:create(group)
    local rows = 4
    local size = self.height/rows
    local mapWidth = self.width/5*4
    --local columns = math.floor(mathWidth/size)
   
    local mapHeight = (self.height/3)*2
    local inventoryHeight = self.height - mapHeight
    self.map = BulbMap(self.width, mapHeight, rows)
    self.map:create(group)
    --self.map:addEventListener("selectTile", self)

    self.inventory = BulbInventory(0, mapHeight, self.width, inventoryHeight, 4)
    self.inventory:create(group)
end

function BulbGame:selectTile(event)
    --self.map:move(event)  
end

function BulbGame:removeSelf(group)
    if(self.map) then
        self.map:removeSelf()
    end
end
