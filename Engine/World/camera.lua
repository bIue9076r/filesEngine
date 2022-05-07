camera = {}

camera.x = 0
camera.y = 0

function camera.updatePos(x,y)
	camera.x = x
	camera.y = y
end

files.game.camera = camera