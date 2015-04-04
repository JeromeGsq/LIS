Game = Core.class(Stage)
nbOid = 0

bck = Bitmap.new(Texture.new("img/background.png", false))
stage:addChild(bck)


NRJ = Item.new()
ship1 = Ship.new(application:getContentWidth()/2,90*application:getContentHeight()/100)


asteTab = {}

for i=1,8 do
	asteTab[i] = Enemy.new(ship1)
end

function Game:resetAsteroid()
	for i=1,8 do
		asteTab[i]:hit()
	end
end
ui = Bitmap.new(Texture.new("img/UI.png", false))
stage:addChild(ui)



local function onTouchesBegin(event)
	nbOid = nbOid + 1
	if  event.allTouches[2] ~= nil and event.touch.id == 2 then
		if event.allTouches[2].x < application:getContentWidth()*0.25 then
			ship1:moveX("moveLeft")
		elseif event.allTouches[2].x > application:getContentWidth()*0.75 then
			ship1:moveX("moveRight")
		end
	elseif  event.touch.id == 1 and event.allTouches[1]  then
		if event.allTouches[1].x < application:getContentWidth()*0.25 then
			ship1:moveX("moveLeft")
		elseif event.allTouches[1].x > application:getContentWidth()*0.75 then
			ship1:moveX("moveRight")
		end
	end
	
	
	

end

local function onTouchesEnd(event)
	nbOid = nbOid - 1
	if event.touch.id == 2 and event.allTouches[1] ~= nil then
		if event.allTouches[1].x < application:getContentWidth()*0.25 then
			ship1:moveX("moveLeft")
		elseif event.allTouches[1].x > application:getContentWidth()*0.75 then
			ship1:moveX("moveRight")
		end
	elseif event.touch.id == 1 and event.allTouches[2] ~= nil then
		if event.allTouches[2].x < application:getContentWidth()*0.25 then
			ship1:moveX("moveLeft")
		elseif event.allTouches[2].x > application:getContentWidth()*0.75 then
			ship1:moveX("moveRight")
		end
	else
		ship1:moveX("wait")
	end
end


stage:addEventListener(Event.TOUCHES_END, onTouchesEnd)
stage:addEventListener(Event.TOUCHES_BEGIN, onTouchesBegin)



