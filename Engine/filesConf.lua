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

files.update = function(dt)
	sound.update(dt)
	video.update(dt)
	timer.update(dt)
end

files.draw = function()
	video.draw()
	timer.draw()
end