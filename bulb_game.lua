require("class")
require("bulb_map")
require("bulb_inventory")
require("bulb_color")

-- init function
-- when initialized from bulbasaur_game_scene, automatically given access to self var

BulbGame = class(function(c, width, height, composer)
    c.width = width
    c.height = height

    -- to remove...
    c.map = nil
    c.inventory = nil

    c.state = "nothing"
    c.selectedPlant = nil
    c.composer = composer
    c.home = {
        tileName = "home",
        color = BulbColor(100,100,50)
    }
end)

-- explicit create function, creates and display

function BulbGame:create(group)
    --home = {tileName = "home", color=BulbColor(100,100,50)}
    local rows = 4
    local size = self.height/rows
    local mapWidth = self.width/5*4
    --local columns = math.floor(mathWidth/size)
   
    local mapHeight = (self.height/3)*2
    local inventoryHeight = self.height - mapHeight
    self.map = BulbMap(self.width, mapHeight, rows)
    self.map:create(group)
    --self.map:addEventListener("selectTile", self)

    local debugScreen = {
        tileName = "home",
        color = BulbColor(100,100,50)
    }
    self.inventory = BulbInventory(0, mapHeight, self.width, inventoryHeight, 4, debugScreen)
    --self.inventory:addEventListener("selectPlant", self)
    self.inventory:addEventListener("selectTool", self)
    self.inventory:create(group)

    Runtime:addEventListener("enterFrame", self)
end

function BulbGame:enterFrame()
    self:update()
end

function BulbGame:update()
    self.map:update()
end

function BulbGame:selectTile(event)
    --self.map:move(event)  
end

function BulbGame:selectTool(data)
    if(data.type == "home") then
        print(data.type)
        --BulbGame:removeSelf()
        self.composer.gotoScene("bulb_debug_scene", "fade", 500)
    --else
        --self.state = "tooling"
        --self.selectedTool = data.type
    end
end

function BulbGame:removeSelf(group)
    if(self.map) then
        self.map:removeSelf()
    end
    if(self.inventory) then
        self.inventory:removeSelf()
    end
end
