Game = Core.class(Stage)

local function onTouchesBegin(event)
	 
	print(event.touch.id)
	
	if event.touch.id == 2 then
		if event.allTouches[2].x < application:getContentWidth()*0.25 then
			ship1:moveX("moveLeft")
		elseif event.allTouches[2].x > application:getContentWidth()*0.75 then
			ship1:moveX("moveRight")
		end
	elseif event.touch.id == 1 then
		if event.allTouches[1].x < application:getContentWidth()*0.25 then
			ship1:moveX("moveLeft")
		elseif event.allTouches[1].x > application:getContentWidth()*0.75 then
			ship1:moveX("moveRight")
		end
	end
	
	
	

end
--pokjhgfd
local function onTouchesEnd(event)

	print(event.allTouches[1].x)

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




bck = Bitmap.new(Texture.new("img/background.png", false))
stage:addChild(bck)
