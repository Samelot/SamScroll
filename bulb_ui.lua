require("class")
require("bulb_store_debug")
require("bulb_color")

BulbUI = class(function(c, x, y, width, height, itemNumber)
    c.x = x
    c.y = y
    c.width = width
    c.height = height
    c.itemNumber = itemNumber
    c.itemHeight = height/itemNumber
    c.events = {}
end)

function BulbUI:create(group)
    items = {}
    tools = {}

    local homeView = BulbStoreTool(self.x, self.y, self.width, self.itemHeight, self.navigation, self)
    homeView:create(group)
    tools[1] = homeView
 
    local shovel = {tileName="shovel", color=BulbColor(0.6, 0.6, 0.4)}
    local shovelView = BulbStoreTool(self.x, self.y + self.itemHeight, self.width, self.itemHeight, shovel, self)
    shovelView:create(group)
    tools[2] = shovelView
   
    local i = 0
    for k, v in pairs(self.player.itemBag) do
        local y = self.y + (i * self.itemHeight) + self.itemHeight*2
        local item = bulbGameSettings:getItemByName(k)
        local bulbStoreItem = BulbStoreItem(self.x, y, self.width, self.itemHeight, item,
                                self.player.itemBag[item.tileName].inventory, self)
        bulbStoreItem:create(group)
        items[k] = bulbStoreItem
        i = i + 1
    end
    self.items = items
    self.tools = tools
    self.player:addEventListener("itemUpdated", self)
end

function BulbUI:itemUpdated(event)
    self.items[event.type]:updateInventory(event.newValue)
end

-- these 2 functions below are confusing. Important to understand
function BulbUI:addEventListener(type, object)
    if (not self.events[type]) then
        self.events[type] = {}
    end
    -- obj passed from bulb_game, obj assigned to events[]
    self.events[type][#self.events[type] + 1] = object
end

function BulbUI:dispatchEvent(data)
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

function BulbUI:plantingFunction(item)
    plantEvent = {
        name = "selectPlant",
        item = item
    }
    BulbUI.dispatchEvent(self, plantEvent)
end

function BulbUI:selectTool(type)
    toolEvent = {
        name = "selectTool",
        type = type
    }
    BulbUI.dispatchEvent(self, toolEvent)
end

function BulbUI:removeSelf()
    for i=0, #self.tools do
        self.tools[i]:removeSelf()
        self.tools[i] = nil
    end
    for k, v in pairs(self.items) do
        self.items[k]:removeSelf()
        self.items[k] = nil
    end
end

