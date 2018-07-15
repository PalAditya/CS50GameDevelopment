--[[
    GD50
    Match-3 Remake

    -- Tile Class --

    Author: Colton Ogden
    cogden@cs50.harvard.edu

    The individual tiles that make up our game board. Each Tile can have a
    color and a variety, with the varietes adding extra points to the matches.
]]

--TODO:Show shiny appearance

Tile = Class{}

function Tile:init(x, y, color, variety)
    
    -- board positions
    self.gridX = x
    self.gridY = y

    -- coordinate positions
    self.x = (self.gridX - 1) * 32
    self.y = (self.gridY - 1) * 32

    -- tile appearance/points
    self.color = color
    self.variety = variety
	x=math.random(1,64)
	if x%17==0 then
		self.shiny=true
	else
		self.shiny=false
	end
	--self.shiny=true
end

function Tile:render(x, y)
    
    -- draw shadow
    love.graphics.setColor(34, 32, 52, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x + 2, self.y + y + 2)

    -- draw tile itself
	--[[if self.shiny then
		love.graphics.setColor(52,14,36,255)
	else
		love.graphics.setColor(255, 255, 255, 255)
	end]]--
	love.graphics.setColor(255, 255, 255, 255)
    love.graphics.draw(gTextures['main'], gFrames['tiles'][self.color][self.variety],
        self.x + x, self.y + y)
	if self.shiny then
		love.graphics.setColor(0,255,0,255)
		love.graphics.printf('S',self.x,self.y,8,'center')
	end
end