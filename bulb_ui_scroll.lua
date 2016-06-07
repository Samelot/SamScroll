----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- only make one! kind of like a singleton
-- require("bulb_game_settings")

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

-- bulbGameSettings = BulbGameSettings()

-- include the Corona "composer" module
local composer = require("composer")

-- load menu screen
-- composer.gotoScene( "bulbasaur_game_scene" )

local paint = {
    type = "gradient",
    color1 = {1, 1, 1},
    color2 = {0, 0, 0},
    direction = "down"
}

local scrollTouch = display.newRect(0, 0, display.contentWidth-5, display.contentHeight-5)
scrollTouch:setFillColor(0, 0, .8)
scrollTouch.alpha = 0 -- not in use for now
scrollTouch.anchorX = 0.5
scrollTouch.anchorY = 0.5
scrollTouch.x = display.contentWidth / 2
scrollTouch.y = display.contentHeight / 2


local scrollSel = display.newRect(0, 0, display.contentWidth, display.contentHeight*2)
scrollSel.fill = paint
scrollSel:setStrokeColor(1,1,1)
scrollSel.strokeWidth = 5
scrollSel.anchorX = 0.5
scrollSel.anchorY = 0
scrollSel.x = display.contentWidth / 2
scrollSel.y = display.contentHeight / 2

scrollTouch:toFront()

local player = display.newRect(0, 0, 8, 8)
player:setFillColor(.5, 0, 0)
player.anchorX = 0.5
player.anchorY = 0.5
player.x = display.contentWidth / 2
player.y = display.contentHeight / 2

local function scrollRel(event)
    if (event.phase == "began" or event.phase == "moved") then
        player.x = event.x
        player.y = event.y
        if(event.y < 0) then
            event.y = 0 
        elseif(event.y > display.contentHeight) then
            event.y = display.contentHeight
        end
        local calc = event.y - (scrollSel.height/2)
        print(calc)
        scrollSel.y = calc
    end
end

local beginPos = nil
local delta = 0
local deltaY = 0
local absDelta = 0
local lowestDelta = nil

local function scrollAbs(event)
    if(event.phase == "began") then
        beginPos = event.y

    elseif(event.phase == "moved") then
        --local line = display.newLine(event.xStart, event.yStart, event.x, event.y)
        --line:setStrokeColor(0, 0, .8)
        --line.strokeWidth = 5
            
        player.x = event.x
        player.y = event.y
           
        delta = deltaY
        if(event.y ~= beginPos) then 
        if(event.y < display.actualContentHeight) and (event.y > 0) then
            deltaY = (beginPos - event.y) * -1            
            --deltaY = deltaY * 1
            delta = deltaY
    
            absDelta = math.abs(delta)

            if(not lowestDelta) or (absDelta < lowestDelta) then
                lowestDelta = absDelta
            end
 
            delta = delta / 40
            deltaY = deltaY / 40
                
            if (delta >= 1) then
               delta = math.floor(delta/lowestDelta)
            else 
               delta = math.ceil(delta/lowestDelta)
            end
            
            if (deltaY >= 1) then
               deltaY = math.floor(deltaY/lowestDelta)
            else 
               deltaY = math.ceil(deltaY/lowestDelta)
            end
         
            print(delta)
            print(deltaY)
        end      
        end
    elseif(event.phase == "ended") then
        beginPos = nil
    end
end

Runtime:addEventListener("touch", scrollAbs)



