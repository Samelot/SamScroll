require("class")

-- TODO: Split up into 2 classes. Like map --> tile

BulbInventoryItem = class(function(c, i, x, y)
    c.i = i -- id or item number
    c.x = x
    c.y = y

    c.sizeWidth = 20
    c.sizeHeight = 20
    
    -- TODO: Rename!
    c.itemView = nil
    c.nameView = nil
    --c.events = {}
end)

function BulbInventoryItem:create(group)
    local itemView = display.newRect(self.x, self.y, self.sizeWidth, self.sizeHeight)
    itemView:setFillColor(.2, .8, .2)
    itemView:setStrokeColor(1)
    itemView.strokeWidth = 1
    -- anchor set top-left
    itemView.anchorX = 0
    itemView.anchorY = 0
    itemView.id = "item" .. self.i
    self.itemView = itemView
    
    group:insert(self.itemView)

    --[[
    local nameViewOptions = {
        --text = self.item.tileName,
        text = "inventory",
        x = 0,
        y = 0,
        width = self.width,
        height = self.height,
        font = native.systemFont,
        fontSize = 24,
        align = "left"
    }

    -- Add name text
    local nameView = display.newText(nameViewOptions)  
    -- Cool for prototyping: inverse color
    -- nameView:setFillColor(1-1/self.itemType, 1-1/self.itemType, 1)
    nameView:setFillColor(0, 0, 0)
    -- anchor set top-left
    nameView.anchorX = 0
    nameView.anchorY = 0
    nameView.x = self.x
    nameView.y = self.y
    self.nameView = nameView
    
    --group:insert(self.itemView)
    --group:insert(self.nameView)
    ]]--
end

function BulbInventoryItem:updateInventory(newValue)
    --self.inventoryView.text = newValue
    --self.inventory = newValue
end

function BulbInventoryItem:touch(event)
    --[[
    local destination = {}
    if (event.phase == "began") then
        destination.x = event.x
        destination.y = event.y
       
        self.ui:plantingFunction(self.item)
    end
    ]]--
end

function BulbInventoryItem:removeSelf()
    if(self.nameView) then
        self.nameView:removeSelf()
        self.nameView = nil
    end
    if(self.itemView) then
        self.itemView:removeSelf()
        self.itemView = nil
    end
end
