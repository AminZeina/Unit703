-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Amin Zeina
-- Created on: Apr 2018
--
-- Gravity
-----------------------------------------------------------------------------------------

local physics = require( "physics" )

physics.start()
physics.setGravity( 0, 25 )
-- physics.setDrawMode( "hybrid" )

local theGround = display.newImage( "./assets/sprites/land.png" )
theGround.x = display.contentCenterX
theGround.y = display.contentHeight
theGround.id = "the ground"
physics.addBody( theGround, 'static', {
    friction = 0.5, 
    bounce = 0.3 
    } )

local theGround2 = display.newImage( "./assets/sprites/land.png" )
theGround2.x = 1500
theGround2.y = 1000
theGround2.id = "the ground"
physics.addBody( theGround2, 'static', {
    friction = 0.5, 
    bounce = 0.3 
    } )

local theCharacter = display.newImage( "./assets/sprites/zombie.png" )
theCharacter.x = display.contentCenterX
theCharacter.y = display.contentCenterY
theCharacter.id = "the character"
physics.addBody( theCharacter, "dynamic", { 
    density = 3.0, 
    friction = 0.5, 
    bounce = 0.3 
    } )

local dPad = display.newImage( "./assets/sprites/d-pad.png" )
dPad.x = 150
dPad.y = display.contentHeight - 150
dPad.id = "d-pad"
dPad.alpha = 0.50

local upArrow = display.newImage( "./assets/sprites/upArrow.png" )
upArrow.x = 150
upArrow.y = display.contentHeight - 260
upArrow.id = "up arrow"

local downArrow = display.newImage( "./assets/sprites/downArrow.png" )
downArrow.x = 150
downArrow.y = display.contentHeight - 40
downArrow.id = "up arrow"

local rightArrow = display.newImage( "./assets/sprites/rightArrow.png" )
rightArrow.x = 260
rightArrow.y = display.contentHeight - 150
rightArrow.id = "up arrow"

local leftArrow = display.newImage( "./assets/sprites/leftArrow.png" )
leftArrow.x = 40
leftArrow.y = display.contentHeight - 150
leftArrow.id = "up arrow"
 
function upArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- moves character up
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 pixels horizontally
        	y = -50, -- move 50 pixels up
        	time = 100 -- move in 100 milliseconds
        	} )
    end

    return true
end

function downArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- moves character down
        transition.moveBy( theCharacter, { 
        	x = 0, -- move 0 pixels horizontally
        	y = 50, -- move 50 pixels down
        	time = 100 -- move in 100 milliseconds
        	} )
    end

    return true
end

function rightArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- moves character right
        transition.moveBy( theCharacter, { 
        	x = 50, -- move 50 pixels right
        	y = 0, -- move 0 pixels vertically
        	time = 100 -- move in 100 milliseconds
        	} )
    end

    return true
end

function leftArrow:touch( event )
    if ( event.phase == "ended" ) then
        -- moves character left
        transition.moveBy( theCharacter, { 
        	x = - 50, -- move 50 pixels left
        	y = 0, -- move 0 pixels vertically
        	time = 100 -- move in 100 milliseconds
        	} )
    end

    return true
end

upArrow:addEventListener( "touch", upArrow )
downArrow:addEventListener( "touch", downArrow )
rightArrow:addEventListener( "touch", rightArrow )
leftArrow:addEventListener( "touch", leftArrow )