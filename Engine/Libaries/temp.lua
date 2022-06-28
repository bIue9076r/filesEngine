temp = {}
temp.values = {}

function temp.newVar(n,var)
	temp.values[n] = var
end

function temp.setVar(n,var)
	temp.values[n] = var
end

function temp.getVar(n)
	return temp.values[n]
end

function temp.delVar(n)
	temp.values[n] = nil
end

function temp.newBool(n)
	temp.values[n] = temp.values[n] or false
end

function temp.getBool(n)
	return not(temp.values[n])
end

function temp._getBool(n)
	return temp.values[n]
end

function temp.delBool(n)
	temp.values[n] = true
end

files.temp = temp