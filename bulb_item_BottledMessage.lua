require("class")

BulbItemBottledMessage = class(function(c, originY, tileContainerHeight)
    c.originY = originY
    c.tileContainerHeight = tileContainerHeight
    c.bottledMessage = nil
end)

function BulbItemBottledMessage:create(group)
    local bottledMessage = display.newCircle(10+math.floor(math.random()*300), self.originY, 5)
    bottledMessage:setFillColor(.8, 0, 0)
    bottledMessage.anchorX = .5
    bottledMessage.anchorY = .5
    self.bottledMessage = bottledMessage
    
    -- inserts to group
    group:insert(self.bottledMessage)


end

