--filesConf.lua
files = {}
files.enums = {}
files.timer = {}
files.temp = {}
files.math = {}
files.assets = {}
files.display = {}
files.game = {}

require(LIBPATH.."enums")
require(LIBPATH.."math")
require(LIBPATH.."timer")
require(LIBPATH.."temp")
require(LIBPATH.."display")
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
files.assets.name = 'assets'
files.assets.type = 'table'
files.display.name = 'display'
files.display.type = 'table'
files.game.name = 'game'
files.game.type = 'table'

files.update = function(dt)
	sound.update(dt)
	video.update(dt)
	timer.update(dt)
end

files.draw = function()
	video.draw()
	timer.draw()
end