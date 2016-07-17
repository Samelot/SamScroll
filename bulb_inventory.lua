require("class")
require("bulb_inventory_item")
require("bulb_inventory_debug")

-- TODO: Split up into 2 classes. Like map --> tile
-- NOTE: Modeled after bulb_ui

BulbInventory = class(function(c, x, y, width, height, items, navigation)
    c.x = x
    c.y = y
    c.width = width
    c.height = height
    
    c.items = items -- originally named itemNumber. see itemsArr and toolsArr
    c.itemSize = 20
    
    c.itemsArr = nil
    c.toolsArr = nil

    c.itemContainerWidth = c.width/items
    c.itemSizeWidth = c.itemContainerWidth/items
    c.inventoryGroup = nil
    c.navigation = navigation
    c.events = {}
end)

function BulbInventory:create(group)
    self.inventoryGroup = display.newGroup()
    --[[
    local inventoryBG = display.newRect(self.x, self.y, self.width, self.height)
    inventoryBG:setFillColor(1, .3, .5)
    inventoryBG.alpha = 1
    inventoryBG.anchorX = 0
    inventoryBG.anchorY = 0
    ]]--
    itemsArr = {}
    toolsArr = {}

    local j = 0
    local originX = 0 -- self.x ?
    local originY = self.y + 34
    --local itemSpacing = self.itemSizeWidth*10 + self.itemSize
    local itemSpacing = self.itemSize + 50
    local margin = nil

    local navOffset = self.x
    if(self.navigation.tileName == "game") then
        navOffset=self.x-40
    end
    -- x, y, width, height, navigation, ui
    local debugView = BulbInventoryDebug(navOffset, originY-34, self.navigation, self)
    debugView:create(self.inventoryGroup)
    toolsArr[1] = debugView

    for i=1, self.items do
        -- math used in bulb_map. rename vars?
        --originX = ((j-1) * self.itemContainerWidth) + (self.itemContainerWidth-self.itemSizeWidth)
        
        if(originX+itemSpacing > self.width) then
            margin = self.width - (originX+self.itemSize)
            j = 1
            originX = 0 
            originY = originY + 54
        else 
            j = j+1
            originX = ((j-1) * itemSpacing) 
        end
        

        local bulbInventoryItem = BulbInventoryItem(i, originX, originY) -- TODO: are originX, originY as var names? offsetX, offsetY? 

        bulbInventoryItem:create(self.inventoryGroup)
        itemsArr[i] = bulbInventoryItem 
    end
    if(margin == nil) then
        margin = self.width - (originX+self.itemSize)
    end
    self.itemsArr = itemsArr 
    self.toolsArr = toolsArr
    
    self.inventoryGroup.x = 0 + margin/2
    self.inventoryGroup:toFront()
    
    group:insert(self.inventoryGroup)
end

function BulbInventory:updateInventory(newValue)
    --self.inventoryView.text = newValue
    --self.inventory = newValue
end

function BulbInventory:touch(event)
    --[[
    local destination = {}
    if (event.phase == "began") then
        destination.x = event.x
        destination.y = event.y
       
        self.ui:plantingFunction(self.item)
    end
    ]]--
end

function BulbInventory:itemUpdated(event)
    self.items[event.type]:updateInventory(event.newValue)
end

-- these 2 functions below are confusing. Important to understand
function BulbInventory:addEventListener(type, object)
    if (not self.events[type]) then
        self.events[type] = {}
    end
    -- obj passed from bulb_game, obj assigned to events[]
    self.events[type][#self.events[type] + 1] = object
end

function BulbInventory:dispatchEvent(data)
    -- Understand: given that listener, call a function using data.name?? 
                      
    -- fetch obj by the event name
    -- self.events[data.name][i]
            
    -- function's name
        -- [data.name]
            
    -- passes object to function                
        -- (self.events[data.name][i], type)
        -- used to be... (self, data)
    if (self.events[data.name]) then
        for i=1, #self.events[data.name] do
            self.events[data.name][i][data.name](self.events[data.name][i], data)
        end
    end
end


function BulbInventory:selectTool(type)
    toolEvent = {
        name = "selectTool",
        type = type
    }
    BulbInventory.dispatchEvent(self, toolEvent)
end

function BulbInventory:removeSelf()
    for i=0, #self.toolsArr do
        self.toolsArr[i]:removeSelf()
        self.toolsArr[i] = nil
    end
    for k, v in pairs(self.itemsArr) do
        self.itemsArr[k]:removeSelf()
        self.itemsArr[k] = nil
    end
end

