require("class")
require("bulb_inventory_item")

-- TODO: Split up into 2 classes. Like map --> tile

BulbInventory = class(function(c, x, y, width, height, items)
    c.x = x
    c.y = y
    c.width = width
    c.height = height
    

    
    c.items = items
    c.itemSize = 20
    
    c.itemContainerWidth = c.width/items
    c.itemSizeWidth = c.itemContainerWidth/items
    c.inventoryGroup = nil
    --c.events = {}
end)

function BulbInventory:create(group)
    self.inventoryGroup = display.newGroup()
    
    local inventoryBG = display.newRect(self.x, self.y, self.width, self.height)
    inventoryBG:setFillColor(1, .3, .5)
    inventoryBG.alpha = 1
    inventoryBG.anchorX = 0
    inventoryBG.anchorY = 0

    local j = 0
    local originX = 0 -- self.x ?
    local originY = self.y + 34
    --local itemSpacing = self.itemSizeWidth*10 + self.itemSize
    local itemSpacing = self.itemSize + 50
    local margin = nil
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
            --print(originX)
        end
        

        local bulbInventoryItem = BulbInventoryItem(i, originX, originY) -- TODO: are originX, originY as var names? offsetX, offsetY? 

        bulbInventoryItem:create(self.inventoryGroup)
    end
    if(margin == nil) then
        margin = self.width - (originX+self.itemSize)
    end
    self.inventoryGroup.x = 0 + margin/2
    self.inventoryGroup:toFront()
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

function BulbInventory:removeSelf()
end
