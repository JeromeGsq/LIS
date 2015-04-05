--[[

	Accelerometer example with basic low-pass filtering
	
]]

Accelerometre = Core.class(Stage)

local filter = 0.05  -- the filtering constant, 1.0 means no filtering, lower values mean more filtering
local fx, fy = 0, 0

function Accelerometre:init()
	self.accelerometre = Accelerometer.new()
	self.accelerometre:start()

	grillesmall = Bitmap.new(Texture.new("img/grillesmall.png"))
	grillesmall:setAnchorPoint(0.5, 0.5)
	stage:addChild(grillesmall)

	grillelarge = Bitmap.new(Texture.new("img/grillelarge.png"))
	grillelarge:setAnchorPoint(0.5, 0.5)
	stage:addChild(grillelarge)

	self:addEventListener(Event.ENTER_FRAME, self.onEnterFrame, self)
end

function Accelerometre:onEnterFrame()
	-- get self values
	local x, y = self.accelerometre:getAcceleration()
	
	-- compensate self according to the screen and device orientataion
	x, y = self:compensateself(x, y)

	-- do the low-pass filtering
	fx = x * filter + fx * (1 - filter)
	fy = y * filter + fy * (1 - filter)

	grillesmall:setPosition(application:getContentWidth()/2 - fx * application:getContentWidth()/5, application:getContentWidth()/3)
	grillelarge:setPosition(application:getContentWidth()/2 - fx * application:getContentWidth()/8, application:getContentWidth()/3)
end

function Accelerometre:compensateself(x, y, z)
	local orientation = application:getOrientation()
	local deviceOrientation = application:getDeviceOrientation()

	local p1 = orientation == "portrait" or orientation == "portraitUpsideDown"
	local p2 = deviceOrientation == "portrait" or deviceOrientation == "portraitUpsideDown"
	
	local rotation = (p1 == p2) and deviceOrientation or orientation

	if rotation == "portrait" then
		return x, y
	elseif rotation == "landscapeLeft" then
		return -y, x
	elseif rotation == "portraitUpsideDown" then
		return -x, -y
	elseif rotation == "landscapeRight" then
		return y, -x
	end	
end