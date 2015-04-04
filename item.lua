Item = Core.class(sprite)


function Enemy:Item()

	self.speed = 10
	self.x = math.random(0, application:getContentWidth())
	self.y = math.random(-100*application:getContentHeight()/100, -20*application:getContentHeight()/100)
	
	self.img = Bitmap.new(Texture.new("img/asteroid.png",true))
	
	self.img:setPosition(self.x,self.y)
	

	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	stage:addChild(self.img)
end