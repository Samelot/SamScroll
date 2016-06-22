require("bulb_game_settings")

system.activate("multitouch") 
math.randomseed(os.time())

-- hide the status bar
display.setStatusBar( display.HiddenStatusBar )

bulbGameSettings = BulbGameSettings()

-- include the Corona "composer" module
local composer = require "composer"

-- load menu screen
composer.gotoScene( "bulbasaur_game_scene" )
