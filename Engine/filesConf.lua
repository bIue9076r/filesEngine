--filesConf.lua
files = {}
files.enums = {}
files.timer = {}
files.temp = {}
files.math = {}
files.mouse = {}
files.assets = {}
files.display = {}
files.range = {}
files.game = {}

require(LIBPATH.."enums")
require(LIBPATH.."math")
require(LIBPATH.."mouse")
require(LIBPATH.."timer")
require(LIBPATH.."temp")
require(LIBPATH.."display")
require(LIBPATH.."range")
require(ASSETMANAGERPATH.."assets")
require(WORLDPATH.."camera")
require(WORLDPATH.."Exp")

files.name = 'files'
files.type = 'table'
files.enums.name = 'enums'
files.enums.type = 'table'
files.timer.name = 'timer'
files.timer.type = 'table'
files.temp.name = 'temp'
files.temp.type = 'table'
files.math.name = 'math'
files.math.type = 'table'
files.mouse.name = 'math'
files.mouse.type = 'table'
files.assets.name = 'assets'
files.assets.type = 'table'
files.display.name = 'display'
files.display.type = 'table'
files.range.name = 'range'
files.range.type = 'table'
files.game.name = 'game'
files.game.type = 'table'

function files.listKeys(table,tpath)
	tpath = tpath or 'ROOT'
	for i,v in pairs(table) do
		if type(v) == 'table' then
			print(tpath..'.'..i..':')
			files.listKeys(v,'\t'..tpath..'.'..i)
		else
			print(tpath..'.'..i)
		end
	end
end

files.update = function(dt)
	sound.update(dt)
	video.update(dt)
	timer.update(dt)
	mouse.update()
end

files.draw = function()
	video.draw()
	timer.draw()
	mouse.draw()
end