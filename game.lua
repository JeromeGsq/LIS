Game = Core.class(Stage)
------------------------ variables ---------------------------
nbOid = 0
score = 0
--------------------------------------------------------------
------------------------- fonts ------------------------------
local font1 = TTFont.new("fonts/visitor1.ttf", application:getContentHeight()*0.07) 

--------------------------------------------------------------

bck = Bitmap.new(Texture.new("img/background.png", false))
stage:addChild(bck)

fondB = Bitmap.new(Texture.new("img/fondB.png", false))
stage:addChild(fondB)

ombretop = Bitmap.new(Texture.new("img/ombretop.png", false))
stage:addChild(ombretop)

acc = Accelerometre.new()

ship1 = Ship.new(application:getContentWidth()/2,90*application:getContentHeight()/100)
NRJ = Item.new(ship1)

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

function Game:init()

	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

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

local label = TextField.new(font1, score) 
label:setPosition(400, 150) 
label:setTextColor(0xffffff)
stage:addChild(label)

function Game:onEnterFrame(event)
	label:setText(score)
end



stage:addEventListener(Event.TOUCHES_END, onTouchesEnd)
stage:addEventListener(Event.TOUCHES_BEGIN, onTouchesBegin)