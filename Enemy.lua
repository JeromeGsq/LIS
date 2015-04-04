Enemy = Core.class(Sprite)

function Enemy:init()

	self.speed = 10
	self.x = math.random(0, application:getContentWidth())
	self.y = math.random(-100*application:getContentHeight()/100, -20*application:getContentHeight()/100)
	
	self.img = Bitmap.new(Texture.new("img/asteroid.png",true))
	
	self.img:setPosition(self.x,self.y)
	

	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
	stage:addChild(self.img)
end


function Enemy:onEnterFrame(event)

	self.y = self.y + self.speed

	self.img:setPosition(self.x,self.y)
	self:outOfScreen()
end

function Enemy:outOfScreen()
	if self.y > application:getContentHeight() then
		self.x = math.random(0, application:getContentWidth())
		self.y =  math.random(-100*application:getContentHeight()/100, -20*application:getContentHeight()/100)
	end
end