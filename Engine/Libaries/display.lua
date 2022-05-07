screen = {}
screen.screen = {}
screen.inputs = {}
screen.screenOffset = 0
screen.screenUpper = 1
screen.screenLower = #screen.screen


function screen.screenPrint(mes,clrt)
	if not clrt then clrt = {255,255,255} end
	local clr = {love.math.colorFromBytes(clrt)}
	if screen.screenOffset > FONTMAXHEIGHT then
		screen.screenOffset = FONTMAXHEIGHT
		screen.screenUpper = screen.screenUpper + 1
	end
	screenTable = {m = {clr,tostring(mes)}}
	table.insert(screen.screen,screenTable)
	screen.screenLower = #screen.screen
	screen.screenOffset = screen.screenOffset + 1
end

function screen.inputsPrint(mes)
	screen.inputs = {}
	inScreenTable = {m = ":"..tostring(mes)}
	table.insert(screen.inputs,inScreenTable)
end

function screen.clearScreen()
	screen.screen = {}
	screen.screenOffset = 0
	screen.screenUpper = 0
	screen.screenLower = #screen.screen
end

function screen.clearInputs()
	screen.inputs = {}
	inScreenTable = {m = ":"}
	table.insert(screen.inputs,inScreenTable)
end

function screen.spliceScreen(minrange,maxrange)
	local index = 0
	for i = minrange,maxrange do
		if screen.screen[i] then
			love.graphics.print(screen.screen[i].m,0,index * DEFAULTFONTSIZE)
			index = index + 1
		end
	end
	if screen.inputs[1] then
		love.graphics.print(screen.inputs[1].m,0,(FONTMAXHEIGHT+1) * DEFAULTFONTSIZE)
	end
end

files.display = screen