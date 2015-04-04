Ship = Core.class(Sprite)

function Ship:init(x,y)

	self.statut = "wait"
	
	self.speed = 2
	self.x = x
	self.y = y
	
	self.img = Bitmap.new(Texture.new("img/vaisseaux.png",true))
	
	self.img:setPosition(self.x,self.y)
	self.img:setAnchorPoint(0.5, 0.5)


	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	stage:addChild(self.img)
end


function Ship:moveX(moving)
	self.statut = moving
end

function Ship:moveY(moving)

end

function Ship:onEnterFrame(event)

	self.img:setPosition(self.x,self.y)
	
	if self.statut == "moveLeft" then
		self.x = self.x - self.speed
	elseif self.statut == "moveRight" then
		self.x = self.x + self.speed
	end
	--self.img:setRotation(self.x)
end