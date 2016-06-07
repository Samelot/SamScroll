require("class")

BulbTile = class(function(c, i, y, sizeWidth, sizeHeight)
    c.i = i -- row id...
    -- c.j = j
    -- c.x = x -- x coord for (center) of rectangle
    c.y = y -- y coord for (center) of rectangle
    c.sizeWidth = sizeWidth
    c.sizeHeight = sizeHeight
    c.tileView = nil
end)

function BulbTile:create(group, type)
    -- display.newRect( [parent,] x, y, width, height )
    local tileView = display.newRect(0, 0, self.sizeWidth, self.sizeHeight)

   -- if(type) then
   --     tileView:setFillColor(1/type, 1/type, 1/type)
   -- else
   --     tileView:setFillColor(0, 1, 0)
   -- end

   tileView:setFillColor(0, 1, 0)
    -- set anchors top-left
    tileView.anchorX = 0
    tileView:anchorY = 0
    tileView.x = 0 -- from self.x
    tileView.y = self.y

    self.tileView = tileView
    group:insert(self.tileView)
end

function BulbTile:removeSelf()
    if(self.tileView) then
        self.tileView:removeSelf() -- destroy rectangles, accessor/method of rect()
        self.tileView = nil
    end
end
