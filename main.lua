function love.load()
	require("/Engine/filesConfig")
	print("loaded engine")
	files.assets.Audio.new("no","/Engine/wildwest.mp3")
	nomp4 = files.assets.Audio.getSound("no")
	files.assets.Audio.loadSound("no",1)
	print("loaded intro song")
	files.assets.Video.new("no","/Engine/no.ogv")
	no2mp4 = files.assets.Video.getVideo("no")
	files.assets.Video.loadVideo("no",0)
	print("ready to draw")
end
function love.update(dt)
	files.update(dt)
end
function love.draw()
	files.draw()
	love.graphics.print("Hello world",200,200)
end