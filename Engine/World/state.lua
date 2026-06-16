State = {}
State.Id = 0
State.Window = Window.new()
State.vars = {}

function State:Load()
	
end

function State:Draw()
	
end

function State:Update(dt)
	
end

function State:Keypressed(key)
	
end

function State:GetId()
	return self.Id
end

function State.new(id,l)
	local tbl = {
		Id = id or 0,
		Window = Window.new(l),
	}
	
	local mt = {
		__call = State.GetId,
		__index = State,
	}
	
	return setmetatable(tbl,mt)
end

files.game.state = State
