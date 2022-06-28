mouse = {}
mouse.x = 0
mouse.y = 0
mouse.down1 = false
mouse.down2 = false
mouse.down3 = false
mouse.loadedEvents = {}
mouse.preloadedEvents = {}
mouse.loadedEventsDraw = {}
mouse.preloadedEventsDraw = {}

function mouse.update()
	mouse.x, mouse.y = love.mouse.getPosition()
	mouse.down1 = love.mouse.isDown(1)
	mouse.down2 = love.mouse.isDown(2)
	mouse.down3 = love.mouse.isDown(3)
	for i,v in pairs(mouse.loadedEvents) do
		if(mouse['down'..v.button]) then
			inx = (v.buttonBounds.minx < mouse.x) and (v.buttonBounds.maxx > mouse.x)
			iny = (v.buttonBounds.miny < mouse.y) and (v.buttonBounds.maxy > mouse.y)
			if (v.activated == true) then
				mouse.loadedEvents[i] = nil
			end
			if(inx) and (iny) and (not(v.activated)) then
				v.eventFunction()
				v.activated = true
			end
		end
	end
	for i,v in pairs(mouse.preloadedEvents) do
		table.insert(mouse.loadedEvents,v)
		mouse.preloadedEvents[i] = nil
	end
end

function mouse.draw()
	for i,v in pairs(mouse.loadedEventsDraw) do
		if(mouse['down'..v.button]) then
			inx = (v.buttonBounds.minx < mouse.x) and (v.buttonBounds.maxx > mouse.x)
			iny = (v.buttonBounds.miny < mouse.y) and (v.buttonBounds.maxy > mouse.y)
			if (v.activated == true) then
				mouse.loadedEventsDraw[i] = nil
			end
			if(inx) and (iny) and (not(v.activated)) then
				v.eventFunction()
				v.activated = true
			end
		end
	end
	for i,v in pairs(mouse.preloadedEventsDraw) do
		table.insert(mouse.loadedEventsDraw,v)
		mouse.preloadedEventsDraw[i] = nil
	end
end

function mouse.Load(event,mseButton,evtBox)
	if (mseButton > 3) and (mseButton < 1) then
		mseButton = 1
	end
	table.insert(mouse.preloadedEvents,{button = mseButton,eventFunction = event,buttonBounds = evtBox,activated = false})
end

function mouse.LoadDraw(event,mseButton,evtBox)
	if (mseButton > 3) and (mseButton < 1) then
		mseButton = 1
	end
	table.insert(mouse.preloadedEventsDraw,{button = mseButton,eventFunction = event,buttonBounds = evtBox,activated = false})
end

files.mouse = mouse