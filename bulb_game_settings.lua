require("class")

BulbGameSettings = class(function(c)
    local types = {}
    types[1] = { tileName="test1", cost=1001 }
    types[2] = { tileName="test2", cost=1002 } 
    types[3] = { tileName="test3", cost=1003 }
    types[4] = { tileName="test4", cost=1004 }
    types[5] = { tileName="test5", cost=1005 }
    types[6] = { tileName="test6", cost=1006 }
    types[7] = { tileName="test7", cost=1007 }
    types[8] = { tileName="test8", cost=1008 }
    types[9] = { tileName="test9", cost=1009 }
    types[10] = { tileName="test10", cost=1010 }
    c.types = types

    c.itemBag = {}
    c.itemBag[1] = { name="test1", inventory=5 }
    c.itemBag[2] = { name="test2", inventory=31 } 
    c.itemBag[3] = { name="test3", inventory=6 }
    c.itemBag[4] = { name="test4", inventory=7 }
    c.itemBag[5] = { name="test5", inventory=46 }
    c.itemBag[6] = { name="test6", inventory=25 }
    c.itemBag[7] = { name="test7", inventory=11 }
    c.itemBag[8] = { name="test8", inventory=18 }
    c.itemBag[9] = { name="test9", inventory=49 }
    c.itemBag[10] = { name="test10", inventory=42 }
end)

--function BulbGameSettings:setupFromData()
--end

--function BulbGameSettings:deductItem(type, num)
--    self.itemBag[type].inventory = self.itemBag[type].inventory - num
--end

