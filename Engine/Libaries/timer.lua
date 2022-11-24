timer = {}
timer.LoadedEventsUpdate = {}
timer.LoadedEventsDraw = {}

function timer.loadEvent(n,del,args,drw)
	if drw then
		table.insert(
			timer.LoadedEventsDraw,
			{event = n, eventargs = args, delay = del, activated = false}
		)
	else
		table.insert(
			timer.LoadedEventsUpdate,
			{event = n, eventargs = args, delay = del, activated = false}
		)
	end
end

function timer.clearall()
	for i,v in pairs(timer.LoadedEventsUpdate) do
		timer.LoadedEventsUpdate[i] = nil
	end
	for i,v in pairs(timer.LoadedEventsDraw) do
		timer.LoadedEventsDraw[i] = nil
	end
end

function timer.update(dt)
	for i,v in pairs(timer.LoadedEventsUpdate) do
		v.delay = v.delay - dt
		if v.delay < 0 and v.activated == false then
			v.event(table.unpack(v.eventargs))
			v.activated = true
		end
		if v.delay < -3 then -- trash collection
			timer.LoadedEventsUpdate[i] = nil
		end
	end
end

function timer.draw()
	local dt = love.timer.getDelta()
	for i,v in pairs(timer.LoadedEventsDraw) do
		v.delay = v.delay - dt
		if v.delay < 0 and v.activated == false then
			v.event(table.unpack(v.eventargs))
			v.activated = true
		end
		if v.delay < -30 then -- trash collection
			timer.LoadedEventsDraw[i] = nil
		end
	end
end

files.timer = timer