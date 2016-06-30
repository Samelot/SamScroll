require("class")
require("bulb_map")
require("bulb_inventory")
require("bulb_color")

-- init function
-- when initialized from bulbasaur_game_scene, automatically has access to self var

BulbDebug = class(function(c, width, height, composer)
    c.width = width
    c.height = height
    c.map = nil
    c.inventory = nil
    c.state = "nothing"
    c.selectedPlant = nil
    c.composer = composer
    c.home = {
        tileName = "game",
        color = BulbColor(100,100,50)
    }
end)

-- explicit create function, creates and displays

function BulbDebug:create(group)
    --self.player = BulbPlayer()
  
    local mapHeight = (self.height/3)*2
    local inventoryHeight = self.height - mapHeight

    local gameScreen = {
        tileName = "game",
        color = BulbColor(100,100,50)
    }
    self.inventory = BulbInventory(0, mapHeight, self.width, inventoryHeight, 4, gameScreen)
    --self.inventory:addEventListener("selectPlant", self)
    self.inventory:addEventListener("selectTool", self)
    self.inventory:create(group)

    Runtime:addEventListener("enterFrame", self)
end

function BulbDebug:enterFrame()
    self:update()
end

function BulbDebug:update()
end

function BulbDebug:selectTool(data)
    if(data.type == "game") then
        print(data.type)
        --BulbDebug:removeSelf()
        self.composer.gotoScene("bulbasaur_game_scene") --RENAME
    end
end

function BulbDebug:setPlanting(plantType)
    print("trying to plant: " .. plantType)
end

function BulbDebug:removeSelf(group)
    if(self.map) then
        self.map:removeSelf()
    end
    if(self.inventory) then
        self.inventory:removeSelf()
    end
end

