function love.load()
	require("/Engine/filesConfig")
	listKeys(files)
end
function love.update(dt)
	files.update(dt)
end
function love.draw()
	files.draw()
	love.graphics.print("Hello world",200,200)
end