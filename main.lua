function listKeys(table,tpath)
	tpath = tpath or 'ROOT'
	for i,v in pairs(table) do
		if type(v) == 'table' then
			print(tpath..'.'..i..':')
			listKeys(v,'\t'..tpath..'.'..i)
		else
			print(tpath..'.'..i)
		end
	end
end

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