-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}
SheetInfo.sheet =
{
    frames = {
        {
            x=0, --2
            y=0,
            width=320, -- fullsize 149
            height=320
        },
        {
            x=320, --151
            y=0,
            width=320, -- fullsize 149
            height=320
        },
        {
            x=640, --300
            y=0,
            width=320, -- fullsize 149
            height=320,
        },
        {
            x=1280, --300
            y=0,
            width=320, -- fullsize 149
            height=320,

        },
        {
            x=960, 
            y=0,
            width=320, -- 848
            height=320,
        },
        {
            x=1600, 
            y=0,
            width=320, -- 848
            height=320,
        },   
        {
            x=0, 
            y=320,
            width=320, -- 848
            height=320,
        },    
        {
            x=320,
            y=320,
            width=320, -- 902 full
            height=320,
        },
        {
            x=640,
            y=320,
            width=320,
            height=320,
        },
        {
            x=960,
            y=320,
            width=320,
            height=320,
        },
        {
            x=1280,
            y=320,
            width=320, -- 812
            height=320,
        },
        {
            x=1600,
            y=320,
            width=320,
            height=320,
        },
        {
            x=0,
            y=640,
            width=320,
            height=320,
        },
    },    
    sheetContentWidth = 2048,
    sheetContentHeight = 1024
}

SheetInfo.frameIndex =
{
    ["1"] = 1,
["2"] = 2,
["3"] = 3,
["4"] = 4,
["5"] = 5,
["6"] = 6,
["7"] = 7,
["8"] = 8,
["9"] = 9,
["10"] = 10,
["12"] = 12,
["13"] = 13,
["14"] = 14

}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
