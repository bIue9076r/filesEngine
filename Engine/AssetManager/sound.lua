sound = {}
sound.LoadedSounds = {}

function sound.new(n,p,at)
	if at == "static" then
		Sound = love.audio.newSource(p,'static')
	else
		Sound = love.audio.newSource(p,'stream')
	end
	sound[n] = Sound
end

function sound.getSound(n)
	n = n or ''
	if sound[n] == nil then
		return sound[1] -- replace with blank sound
	end
	return sound[n]
end

function sound.loadSound(n,del)
	if type(n) == 'string' then
		table.insert(sound.LoadedSounds,{sound = sound.getSound(n), delay = del, played = false})
	else
		table.insert(sound.LoadedSounds,{sound = n, delay = del, played = false})
	end
end

function sound.clearall()
	for i,v in pairs(sound.LoadedSounds) do
		sound.LoadedSounds[i] = nil
	end
end

function sound.update(dt)
	for i,v in pairs(sound.LoadedSounds) do
		v.delay = v.delay - dt
		if v.delay < 0 and v.played == false then
			v.sound:seek(0)
			v.sound:play()
			v.played = true
		end
		if v.delay < -(v.sound:getDuration("seconds")) then -- trash collection
			sound.LoadedSounds[i] = nil
		end
	end
end