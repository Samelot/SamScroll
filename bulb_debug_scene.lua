require("bulb_debug")

local composer = require("composer")
local scene = composer.newScene()

local game 

function scene:create( event )
    local group = self.view
    local game = BulbDebug(display.contentWidth, display.contentHeight, composer)
    game:create(group)
end

function scene:show( event )
    local group = self.view
    print("debugscene")
end

function scene:exit( event )
    local group = self.view
end

function scene:hide( event )
    local group = self.view
end

function scene:destroy( event )
    local group = self.view

    if(game) then
        game:removeSelf()
    end
end

-----

-- Listener setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----

return scene
