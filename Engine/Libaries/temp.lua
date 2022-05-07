temp = {}
temp.values = {}

function temp.newVar(n,var)
	temp.values[n] = var
end

function temp.getVar(n)
	return temp.values[n]
end

function temp.delVar(n)
	temp.values[n] = nil
end

files.temp = temp