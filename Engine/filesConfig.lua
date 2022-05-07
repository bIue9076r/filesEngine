--filesConfig.lua

--options
TEXTUREPATH = ""
FONTPATH = ""
AUDIOPATH = ""
VIDEOPATH = ""
DEFAULTFONTSIZE = 12
MAXHEIGHT = math.floor(love.graphics.getHeight())
MAXWIDTH = math.floor(love.graphics.getWidth())
FONTMAXHEIGHT = math.floor(love.graphics.getHeight()/DEFAULTFONTSIZE) - 3
LIBPATH = "/Engine/Libaries/"
ASSETMANAGERPATH = "/Engine/AssetManager/"
WORLDPATH = "/Engine/World/"

require("/Engine/aliases")
require("/Engine/filesConf")