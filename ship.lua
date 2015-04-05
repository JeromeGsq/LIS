Ship = Core.class(Sprite)

function Ship:init(x,y)
	self.statut = "wait"
	
	self.speed = 18
	self.x = x
	self.y = y
	self:setPosition(self.x, self.y)
	self.vie = 3
	
	self.img = Bitmap.new(Texture.new("img/vaisseaux.png",true))
	
	self.img:setPosition(self.x,self.y)
	self.img:setAnchorPoint(0.5, 0.5)
	
	self.Life1 = Vie.new(837,27)
	self.Life2 = Vie.new(901,27)
	self.Life3 = Vie.new(965,27)
	
	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)

	stage:addChild(self.img)
end


function Ship:moveX(moving)
	self.statut = moving
end

function Ship:onEnterFrame(event)
	if nbOid == 0 then self.statut = "wait" end
	self:setPosition(self.x, self.y)
	self.img:setPosition(self.x,self.y)
	
	if self.statut == "moveLeft" then
		self.x = self.x - self.speed
	elseif self.statut == "moveRight" then
		self.x = self.x + self.speed
	end
	self:outofscreen()
end

function Ship:outofscreen()
	if self.x > 1926 then 
		self.x = -5
	end
	if self.x < -6 then 
		self.x = 1925
	end
end

function Ship:die()
	if self.vie == 0 then self.vie = -1 end
	if self.vie == 1 then self.vie = 0 end
	if self.vie == 2 then self.vie = 1 end
	if self.vie == 3 then self.vie = 2 end
	
	if self.vie == 2 then stage:removeChild(self.Life3.img) end
	if self.vie == 1 then stage:removeChild(self.Life2.img) end
	if self.vie == 0 then stage:removeChild(self.Life1.img) end

end