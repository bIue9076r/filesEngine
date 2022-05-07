--Exp module
Exp = {} -- sets the Exp table

function Exp.new() -- Sets a new Exp value
	Exp.count = 0
	Exp.level = 1
end

function Exp.exportCount() -- Returns The Exp count /* For Saving Purposes Only */
	return Exp.count
end

function Exp.exportLevel() -- Returns The Exp level /* For Saving Purposes Only */
	return Exp.level
end	

function Exp.add(n) -- Adds n amount of Exp to Exp.count
	Exp.count = Exp.count + math.ceil(n * math.log(Exp.level + 1))
	if (Exp.level*120) < Exp.count then
		-- If 120 times the current level is Crossed raise Exp.level
		Exp.count = Exp.count - (Exp.level * 120)
		Exp.level = Exp.level + 1
	end
end

function Exp.HardOverride(c,l) -- Sets c as the Exp.count and l as Exp.level
	Exp.count = c
	Exp.level = l
end

files.game.Exp = Exp