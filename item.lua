Item = Core.class(Sprite)


function Item:init(ObjetCollision)

	self.valeur = 100
	self.speed = 10
	self.ObjetCollision = ObjetCollision
	
	self.x = math.random(0, application:getContentWidth())
	self.y = application:getContentHeight()*0.9
	
	self.img = Bitmap.new(Texture.new("img/nrj.png",true))
	
	self.img:setPosition(self.x,self.y)
	self.img:setAnchorPoint(0.5, 0.5)

	stage:addChild(self.img)
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function Item:onEnterFrame(event)

	self.img:setPosition(self.x,self.y)
	self:Collision()
end

function Item:Collision()

		if self.x > self.ObjetCollision:getX() - 47 and self.x < self.ObjetCollision:getX() + 47 then
			self.x = math.random(0, application:getContentWidth())
			score = score + self.valeur
			print(score)
		end

end