Item = Core.class(sprite)


function Item:init()

	self.speed = 10
	
	self.x = math.random(0, application:getContentWidth())
	self.y = application:getContentHeight()*0.9
	
	self.img = Bitmap.new(Texture.new("img/nrj.png",true))
	
	self.img:setPosition(self.x,self.y)
	self.img:setAnchorPoint(0.5, 0.5)

	stage:addChild(self.img)
end