-- Range scanner module
range = {} -- range table

function range.strtbl(instr)
	local index = 1 -- index
	local _out = '' -- temp string
	local rettbl = {} -- return table
	for i = 1,#instr do
		if(instr:sub(i,i) == ',' or instr:sub(i,i) == ' ')then
			rettbl[index] = _out
			_out = ''
			index = index + 1
		else
			_out = _out..instr:sub(i,i)
			rettbl[index] = _out
		end
	end
	
	return rettbl
end

function range.isrange(instr)
	local count = 0
	local rettbl = {false,1,0,0,false,0,0,0}
	--[1] = isrange
	--[2] = first number
	--[3] = range char
	--[4] = second number
	--[5] = iscdir
	--[6] = end second number
	--[7] = dir char
	--[8] = custom dir
	for i = 1,#instr do
		if(instr:sub(i,i) == '~')then
			rettbl = {true,i-1,i,i+1,false,0,0,0}
		elseif(instr:sub(i,i) == '/')then
			rettbl[5] = true
			rettbl[6] = (i - 1)
			rettbl[7] = i
			rettbl[8] = (i + 1)
		end
	end
	
	return rettbl
end

function range.scantable(stbl)
	local rettbl = {} -- return table
	for i = 1,#stbl do
		local num1 -- first number
		local num2 -- second number
		local dir -- range direction
		local isr = range.isrange(stbl[i])
		if(isr[1] == true)then
			num1 = tonumber(stbl[i]:sub(1,isr[2])) or 1
			dir = 1
			if(isr[5] == true)then
				num2 = tonumber(stbl[i]:sub(isr[4],isr[6])) or num1 + 1
				dir = tonumber(stbl[i]:sub(isr[8],#stbl[i])) or 1
			else
				num2 = tonumber(stbl[i]:sub(isr[4],#stbl[i])) or num1 + 1
			end
			if(num2 < num1)then dir = -dir; end
			for j = num1,num2,dir do
				table.insert(rettbl,j)
			end
		else
			table.insert(rettbl,tonumber(stbl[i]))
		end
	end
	return rettbl
end

function range.parse(str)
	return range.scantable(range.strtbl(str))
end

files.range = range