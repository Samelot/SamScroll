require("class")
require("bulb_tile")
require("bulb_item_BottledMessage")
require("bulb_game_settings")

BulbMap = class(function(c, width, height, rows)
    c.width = width
    c.height = height
    c.rows = rows
    c.tileSizeWidth = c.width 
    
    -- in TylerMakes, params passed to BulbTile change throughout the for loop. 
    -- Understand c.height/rows
    c.tileContainerHeight = c.height/rows
    c.tileSizeHeight = c.tileContainerHeight/rows

    c.layers = {}
    c.events = {} 
    c.tileGroup = nil
    c.touchMapEvent = {
        i = nil
    }
end)

function BulbMap:create(group)
    self.tileGroup = display.newGroup()


    local sheetInfo = require("bulb_sheet_sun")
    local myImageSheet = graphics.newImageSheet( "sun.png", sheetInfo:getSheet() )
    local seq = {
        { name="a", frames={1,2,3,4,5,6,7,8,10,11,12,13,14}, time =800, loopCount=0} 
    }
    local sprite = display.newSprite( myImageSheet, seq )
    sprite.anchorX = 0
    sprite.anchorY = 0
    sprite:toFront()
    sprite:play()

    self.layers[1] = {} -- in my game, this array is 1-dimensional
    local originY = nil
    local coolorsPalette = bulbGameSettings:getCoolorsPalette(7)
    for i=1, self.rows do
        self.layers[1][i] = {}
        -- in TylerMakes, params passed to BulbTile change throughout the for loop.
        originY = ((i-1) * self.tileContainerHeight) + (self.tileContainerHeight-self.tileSizeHeight)
        --print("tileSizeHeight:", self.tileSizeHeight, "originY:", originY)
        self.layers[1][i] = BulbTile(i, originY, self.tileSizeWidth, self.tileSizeHeight, coolorsPalette[i]) -- TODO: self.tileSizeWidth to self.width
        self.layers[1][i]:create(self.tileGroup)
        for i=1, #self.layers[1] do
            local bottledMessage = BulbItemBottledMessage(originY, self.tileContainerHeight)
            bottledMessage:create(self.tileGroup)
        end
    end
    self.tileGroup:addEventListener("touch", self)
    group:insert(self.tileGroup)
end

function BulbMap:update()
    for i=1, #self.layers[1] do
        for j=1, #self.layers[1][i] do
            self.layers[1][i][j]:update()
        end
    end
end


function BulbMap:addEventListener(type, object)
    if(not self.events[type]) then
        self.events[type] = {}
    end
    -- obj passed from bulb_map, obj assigned to events[]
    self.events[type][#self.events[type] + 1] = object
end

function BulbMap:dispatchEvent(data)
    --if(self.events[data.name]) then
        --for i=1, #self.events[data.name] do
            -- Understand: given that listener, call a function using data.name?? 
            -- fetch obj by the event name
                -- self.events[data.name][i]
            -- function's name
                -- [data.name]
            -- passes object to function                
                -- (self.events[data.name][i], type)
                -- used to be... (self, data)
            -- MOST IMPORTANT: write out exactly what this function is!
            --self.events[data.name][i][data.name](self.events[data.name][i], data)
        --end
    --end
end

function BulbMap:touch(event)
    if(event.phase == "began" and (not self.touchMapEvent.i)) then
        local i = math.floor(event.y / self.tileContainerHeight) + 1
        local originY = ((i-1) * self.tileContainerHeight) + (self.tileContainerHeight - self.tileSizeHeight)
        self.touchMapEvent = {
            i = i,
            originY = originY
        }
        if((event.y > self.touchMapEvent.originY) and
           (event.y < self.touchMapEvent.originY + self.tileSizeHeight)) then
            self.layers[1][self.touchMapEvent.i]:move(event.y)
        end
        display.getCurrentStage():setFocus(event.target)
        event.target.isFocus = true
    elseif(event.target.isFocus) then
        if(event.phase == "moved") then
            print("i: ", self.touchMapEvent.i, "originY: ", self.touchMapEvent.originY)
            self.layers[1][self.touchMapEvent.i]:move(event.y)
        elseif(event.phase == "ended" or event.phase == "cancelled") then
            print("reset to:", self.layers[1][self.touchMapEvent.i].y)
            self.layers[1][self.touchMapEvent.i]:reset()
            self.touchMapEvent.i = nil
            self.touchMapEvent.originY = nil
            display.getCurrentStage():setFocus(nil)
            event.target.isFocus=false
        end
    end
    return true
end

function BulbMap:removeSelf()
    print("remove in map")
    if(self.layers[1]) then
        for i=1, #self.layers[1] do
            self.layers[1][i]:removeSelf()
            self.layers[1][i] = nil
        end
    end
end
