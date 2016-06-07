require("class")
--require("bulb_tile")

BulbMap = class(function(c, width, height, rows)
    c.width = width
    c.height = height
    c.rows = rows
    -- c.columns = columns
    c.tileSizeWidth = c.width 
    -- in TylerMakes, params passed to BulbTile change throughout the for loop. 
    -- Understand c.height/rows
    c.tileSizeHeight = c.height/rows
    c.layers = {}
    c.events = {}
    c.tileGroup = nil
end)

function BulbMap:create(group)
    self.tileGroup = display.newGroup()
    self.layers[1] = {} -- in my game, this array is 1-dimensional

    for i=1, self.rows do
        --self.layers[1][i] = {}
        -- in TylerMakes, params passed to BulbTile change throughout the for loop.
        
        --self.layers[1][i] = BulbTile(i, (i-1) * self.tileSizeHeight, self.tileSizeWidth, self.tileSizeHeight) -- self.tileSizeWidth to self.width
            
        --self.layers[1][i]:create(self.tileGroup)
    end
    
    -- self.tileGroup:addEventListener("touch", self)
end

function BulbMap:touch(event)
end

function BulbMap:addEventListener(type, object)
end

function BulbMap:dispatchEvent(data)
end

function BulbMap:removeSelf()
    --if(self.layers[1]) then
        --for i=1, #self.layers[1] do
    --        self.layers[1][i]:removeSelf()
      --      self.layers[1][i] = nil
        --end
   -- end
end
