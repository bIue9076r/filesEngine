video = {}
video.LoadedVideos = {}
video.LoadedVideosToDraw = {}

function video.new(n,p)
	Video = love.graphics.newVideo(p)
	video[n] = Video
end

function video.getVideo(n)
	n = n or ''
	if video[n] == nil then
		return video[1] -- replace with blank video
	end
	return video[n]
end

function video.loadVideo(n,del,vx,vy)
	vx = vx or 0
	vy = vy or 0
	start = love.timer.getTime()
	if type(n) == 'string' then
		table.insert(video.LoadedVideos,{video = video.getVideo(n), delay = del, played = false})
	else
		table.insert(video.LoadedVideos,{video = n, delay = del, played = false})
	end
end

function video.update(dt)
	for i,v in pairs(video.LoadedVideos) do
		v.delay = v.delay - dt
		if v.delay <= 0 and v.played == false then
			video.LoadedVideosToDraw[tostring(v)]={video = v.video,vx = v.vx,vy = v.vy}
			v.video:seek(0)
			v.video:play()
			v.played = true
		end
		if v.delay < -(v.video:getSource():getDuration("seconds")) then -- trash collection
			print(love.timer.getTime() - start)
			video.LoadedVideos[i] = nil
			video.LoadedVideosToDraw[tostring(v)] = nil
		end
	end
end

function video.draw()
	for i,v in pairs(video.LoadedVideosToDraw) do
		love.graphics.draw(v.video,v.vx,v.vy)
	end
end