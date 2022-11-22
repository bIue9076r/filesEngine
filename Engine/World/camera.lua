camera = {}

camera.x = 0 -- default camera coord x
camera.y = 0 -- default camera coord y
camera.z = 0 -- default camera coord z

function camera:updatePos(x,y,z)
	self.x = x or 0
	self.y = y or 0
	self.z = z or 0
end

function camera:pos()
	return {x = self.x,y = self.y,z = self.z}
end

function camera.new(ix,iy,iz)
	tbl = {x = ix or 0, y = iy or 0, z = iz or 0}
	return setmetatable(tbl,{__index = camera, __call = camera.pos})
end

files.game.camera = camera