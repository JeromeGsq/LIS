Enemy = Core.class(Sprite)

function Enemy:init(ObjetCollision)

	self.ObjetCollision = ObjetCollision

	self.speed = 10
	self.x = math.random(0, application:getContentWidth())
	self.y = math.random(-100*application:getContentHeight()/100, -20*application:getContentHeight()/100)
	
	self.img = Bitmap.new(Texture.new("img/asteroid.png",true))
	
	self.img:setPosition(self.x,self.y)
	self.img:setAnchorPoint(0.5, 0.5)
	

	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	stage:addChild(self.img)
end


function Enemy:onEnterFrame(event)

	self.y = self.y + self.speed

	self.img:setPosition(self.x,self.y)
	self:outOfScreen()
	self:Collision()
end

function Enemy:outOfScreen()
	if self.y > application:getContentHeight() then
		self.x = math.random(0, application:getContentWidth())
		self.y =  math.random(-100*application:getContentHeight()/100, -20*application:getContentHeight()/100)
	end
end

function Enemy:Collision()
	if self.y + 40 > self.ObjetCollision:getY() - 40 and self.y + 40 < self.ObjetCollision:getY() + 60  then 
		if self.x -40 > self.ObjetCollision:getX() - 47 and self.x -40 < self.ObjetCollision:getX() + 47 then
			Game:resetAsteroid()
			self.ObjetCollision:die()
			application:vibrate() 
		elseif self.x +40 > self.ObjetCollision:getX() - 47 and self.x +40 < self.ObjetCollision:getX() + 47 then
			Game:resetAsteroid()
			self.ObjetCollision:die()
			application:vibrate()

		end
	end

end

function Enemy:hit()
	print("Touché")
	self.x = math.random(0, application:getContentWidth())
	self.y =  math.random(-100*application:getContentHeight()/100, -20*application:getContentHeight()/100)
end