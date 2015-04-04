Vie = Core.class(sprite)

function Vie:init(x,y)
	self.x = x -- C'est quoi ca ?! on fait pas de relatif !!
	self.y = y

	self.img = Bitmap.new(Texture.new("img/life.png",true))
	self.img:setPosition(self.x,self.y)
	stage:addChild(self.img)
end