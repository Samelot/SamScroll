require("class")
require("bulb_color")

BulbGameSettings = class(function(c)
    -- this is a hash table, not a regular array!!
    -- types[1]
    -- types[2]
    -- types[3]
    -- etc...
    
    local coolorsPalette = {}
    coolorsPalette[1] = { 
                            BulbColor(236, 248, 248),
                            BulbColor(238, 228, 225),
                            BulbColor(231, 216, 201),
                            BulbColor(230, 190, 174),
                            BulbColor(178, 150, 125)
    }
    coolorsPalette[2] = { 
                            BulbColor(225, 206, 122),
                            BulbColor(251, 255, 185),
                            BulbColor(253, 214, 146),
                            BulbColor(236, 115, 87),
                            BulbColor(117, 79, 68)
    }
    coolorsPalette[3] = { 
                            BulbColor(213, 197, 200),
                            BulbColor(157, 163, 164),
                            BulbColor(96, 77, 83),
                            BulbColor(219, 127, 142),
                            BulbColor(255, 219, 218)
    }
    coolorsPalette[4] = { 
                            BulbColor(239, 217, 206),
                            BulbColor(222, 192, 241),
                            BulbColor(183, 156, 237),
                            BulbColor(149, 127, 239),
                            BulbColor(113, 97, 239)
    }   
    coolorsPalette[5] = { 
                            BulbColor(34, 34, 59),
                            BulbColor(74, 78, 105),
                            BulbColor(154, 140, 152),
                            BulbColor(201, 173, 167),
                            BulbColor(242, 233, 228)
    }                       
    coolorsPalette[6] = { 
                            BulbColor(54, 33, 62),
                            BulbColor(85, 73, 113),
                            BulbColor(99, 118, 141),
                            BulbColor(138, 198, 208),
                            BulbColor(184, 243, 255)
    }                       
    coolorsPalette[7] = { 
                            BulbColor(122, 199, 79),
                            BulbColor(161, 207, 107),
                            BulbColor(213, 216, 135),
                            BulbColor(224, 200, 121),
                            BulbColor(232, 116, 97)
    }
    coolorsPalette[8] = { 
                            BulbColor(201, 228, 202),
                            BulbColor(135, 187, 162),
                            BulbColor(85, 130, 139),
                            BulbColor(59, 96, 100),
                            BulbColor(54, 73, 88)
    }   
    c.coolorsPalette = coolorsPalette



    --print("working here:", #types)
end)

function BulbGameSettings:getCoolorsPalette(id)
    local newPalette = {}
    for k,j in pairs(self.coolorsPalette[id]) do
        table.insert(newPalette, j)
    end
    return newPalette
end

--[[
function BulbGameSettings:getItemByID(id)
    for k, v in pairs(self.types) do
        if (v.id == id) then
            return v
        end
    end
end

function BulbGameSettings:getItemByName(name)
    return self.types[name]
end
]]--
