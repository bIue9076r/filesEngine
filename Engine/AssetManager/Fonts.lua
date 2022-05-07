font = {}

function font.newFont(n,p,s)
	Font = love.graphics.newFont(p,s)
	font[n] = Font
end

function font.getFont(n)
	return font[n]
end