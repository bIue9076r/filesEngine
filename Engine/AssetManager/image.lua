image = {}
love.filesystem.newFile('MissingTextures.log')

function image.newImage(n,p)
	Image = love.graphics.newImage(p)
	image[n] = Image
end

function image.getImage(n)
	n = n or ''
	if image[n] == nil then
		if (love.filesystem.getInfo(TEXTUREPATH..n..'.png')).type == 'file' then
			image.newImage(n,TEXTUREPATH..n..'.png')
			return image[n]
		end
		love.filesystem.append('MissingTextures.log',tostring(os.time())..": "..n..'\n') ; 
		return image[1] -- replace with blank image
	end
	return image[n]
end