camera = {}

camera.x = 0 -- default camera coord x
camera.y = 0 -- default camera coord y

function camera:updatePos(x,y)
	self.x = x or 0
	self.y = y or 0
end

function camera:pos()
	return {x = self.x,y = self.y}
end

camera.__index = camera
camera.__call = camera.pos
function camera.new(ix,iy)
	tbl = {x = ix or 0, y = iy or 0}
	return setmetatable(tbl,camera)
end

files.game.camera = camera