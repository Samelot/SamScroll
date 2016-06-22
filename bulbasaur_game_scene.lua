require("bulb_game")

local composer = require("composer")
local scene = composer.newScene()

local game

function scene:create(event)
    local sceneGroup = self.view
    --local game = BulbGame(display.actualContentWidth, display.actualContentHeight) -- var derived from BulbGame class, inherits methods :create() and :removeSelf
    local game = BulbGame(display.contentWidth, display.contentHeight) -- var derived from BulbGame class, inherits methods :create() and :removeSelf
       
    game:create(group) -- :create() inherited from bulb_game class
end

function scene:show(event)
    local group = self.view
end

function scene:exit(event)
    local group = self.view
end

function scene:hide(event)
    local group = self.view
end

function scene:destroy(event)
    local group = self.view

    if(game) then
        game:removeSelf() -- :remove(inherited from bulb_game class)
    end
end

scene:addEventListener("create", scene)
scene:addEventListener("show", scene)
scene:addEventListener("hide", scene)
scene:addEventListener("destroy", scene)

return scene
