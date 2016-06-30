-- bulb_inventory_debug

require("class")

BulbInventoryDebug = class(function(c, x, y, setByScene, ui)
    c.x = x
    c.y = y
    c.sizeWidth = 20
    c.sizeHeight = 20
    c.setByScene = setByScene
    c.ui = ui
    c.name = c.setByScene.tileName
    c.itemView = nil
    c.nameView = nil
end)

function BulbInventoryDebug:create(group)
    local itemView = display.newRect(self.x, self.y, self.sizeWidth, self.sizeHeight)
    itemView:setFillColor( self.setByScene.color.r, self.setByScene.color.g, self.setByScene.color.b )
    itemView:setStrokeColor(1)
    itemView.strokeWidth = 1
    -- anchor set top-left
    itemView.anchorX = 0
    itemView.anchorY = 0
    --itemView.id = "item" .. self.i
    self.itemView = itemView

    -- ADD NAME TEXT
    local nameViewOptions = {
        text = self.setByScene.tileName,
        x = 0,
        y = 0,
        width = self.sizeWidth,
        height = self.sizeHeight,
        font = native.systemFont,
        fontSize = 16, 
        align = "left"
    }
    local nameView = display.newText( nameViewOptions )
    nameView:setFillColor( 0, 0, 0 )
    nameView.anchorX = 0;
    nameView.anchorY = 0;
    nameView.x = self.x;
    nameView.y = self.y;
    self.nameView = nameView

    self.itemView:addEventListener("touch", self)
    group:insert(self.itemView)
    group:insert(self.nameView)
end

function BulbInventoryDebug:touch(event)
    local destination = {}
    if ( event.phase == "began" ) then
        destination.x = event.x;
        destination.y = event.y;
        self.ui:selectTool(self.name)
    end
end

function BulbInventoryDebug:removeSelf( )
    if (self.nameView) then
        self.nameView:removeSelf()
        self.nameView = nil
    end
    if (self.itemView) then
        self.itemView:removeSelf()
        self.itemView = nil
    end
end
