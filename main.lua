function love.load()
	require("/Engine/filesConfig")
	files.listKeys(files)
	h = files.sticker.new("Hello world",1)
end
function love.update(dt)
	files.update(dt)
end
function love.draw()
	files.draw()
	love.graphics.print(h:print(),200,200)
end