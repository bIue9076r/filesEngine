mouse = {}
mouse.x = 0
mouse.y = 0
mouse.down1 = false
mouse.down2 = false
mouse.down3 = false
mouse.loadedEvents = {}
mouse.loadedEventsDraw = {}

function mouse.update()
	mouse.x, mouse.y = love.mouse.getPosition()
	mouse.down1 = love.mouse.isDown(1)
	mouse.down2 = love.mouse.isDown(2)
	mouse.down3 = love.mouse.isDown(3)
	for i,v in pairs(mouse.loadedEvents) do
		if(mouse['down'..v.button]) then
			inx = (v.buttonBounds.minx < mouse.x) and (v.buttonBounds.maxx > mouse.x)
			iny = (v.buttonBounds.miny < mouse.y) and (v.buttonBounds.maxy > mouse.y)
			if(inx) and (iny) then
				v.eventFunction()
				mouse.loadedEvents[i] = nil
			end
		end
	end
end

function mouse.draw()
	for i,v in pairs(mouse.loadedEventsDraw) do
		if(mouse['down'..v.button]) then
			inx = (v.buttonBounds.minx < mouse.x) and (v.buttonBounds.maxx > mouse.x)
			iny = (v.buttonBounds.miny < mouse.y) and (v.buttonBounds.maxy > mouse.y)
			if(inx) and (iny) then
				v.eventFunction()
				mouse.loadedEventsDraw[i] = nil
			end
		end
	end
end

function mouse.Load(event,mseButton,evtBox)
	if (mseButton > 3) and (mseButton < 1) then
		mseButton = 1
	end
	table.insert(mouse.loadedEvents,{button = mseButton,eventFunction = event,buttonBounds = evtBox})
end

function mouse.LoadDraw(event,mseButton,evtBox)
	if (mseButton > 3) and (mseButton < 1) then
		mseButton = 1
	end
	table.insert(mouse.loadedEventsDraw,{button = mseButton,eventFunction = event,buttonBounds = evtBox})
end

files.mouse = mouse