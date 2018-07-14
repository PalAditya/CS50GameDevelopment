Powerup=Class{}
function Powerup:init(x,y,t)
	self.x=x
	self.y=y
	self.t=t
end
function Powerup:render()
	if self.t==1 then
		love.graphics.draw(gTextures['main'], love.graphics.newQuad(96,192,16,16,gTextures['main']:getDimensions()), self.x+8,self.y)
	else
		love.graphics.draw(gTextures['main'], love.graphics.newQuad(144,192,16,16,gTextures['main']:getDimensions()), self.x+8,self.y)
	end
end
function Powerup:update(dt)
	--love.graphics.draw(gTextures['main'], love.graphics.newQuad(96,192,16,16,gTextures['main']:getDimensions()), self.x,self.y)
	self.y=self.y+dt*30
end
function Powerup:collides(target)
 if self.x > target.x + 64 or target.x > self.x + 8 then
        return false
    end

    -- then check to see if the bottom edge of either is higher than the top
    -- edge of the other
    if self.y > target.y + 16 or target.y > self.y + 8 then
        return false
    end 

    -- if the above aren't true, they're overlapping
    return true
end