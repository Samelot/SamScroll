require("class")

BulbTile = class(function(c, i, y, sizeWidth, sizeHeight, tileColor)
    c.i = i -- row id...
    -- c.j = j
    -- c.x = x -- x coord for (center) of rectangle
    c.y = y -- y coord for (center) of rectangle
    c.sizeWidth = sizeWidth
    c.sizeHeight = sizeHeight
    c.tileView = nil
    c.tileColor = tileColor
end)

function BulbTile:create(group, type)
    -- display.newRect( [parent,] x, y, width, height )
    local tileView = display.newRect(0, 0, self.sizeWidth, self.sizeHeight-1)
    
    -- TODO: Move to map class?
    tileView:setFillColor(self.tileColor.r, self.tileColor.g, self.tileColor.b)
    -- set anchors top-left
    tileView.anchorX = 0
    tileView.anchorY = 0
    tileView.x = 0 -- from self.x
    tileView.y = self.y
    tileView.id = "tile" .. self.i

    self.tileView = tileView -- TODO: NAMES.... containerView = tile ????
    
    -- inserts to group
    group:insert(self.tileView)
end

function BulbTile:update()
    --[[
    if(self.state == "growing") then
        if(self.harvestCounter >= 1) then
            self.harvestCounter = self.harvestCounter - 1
            self.harvestCountView.text = self.harvestCounter
        else
            self.state = "harvestable"
            self.harvestCountView.text = "HARVEST"
        end
    end
    ]]--
end

function BulbTile:move(data)
    local y = data
    self.tileView.y = y-self.sizeHeight/2
end

function BulbTile:reset()
    self.tileView.y = self.y 
end

function BulbTile:removeSelf()
    if(self.tileView) then
        self.tileView:removeSelf() -- destroy rectangles, accessor/method of rect()
        self.tileView = nil
    end
end
