Grid = Core.class(Sprite)

function Grid:init(img, z, object)
	self.img = Bitmap.new(Texture.new(img,false))
	self.img:setAnchorPoint(0.5, 0.75)
	
	self.object = object
	
	self.statut = "wait"
	
	self.z = z
	
	self.x = self.object:getX()
	self.y = self.object:getY()
	
	self.img:setPosition(self.x,self.y)

	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	stage:addChild(self.img)
end

function Grid:onEnterFrame()
	self.img:setPosition(self.object:getX(), self.object:getY())
end

