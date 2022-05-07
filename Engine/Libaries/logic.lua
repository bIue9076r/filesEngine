Logic = {
    
    System = require(LIBPATH.."logicSystem");

    TOBOOL = {["true"]=true,["false"]=false,["1"]=true,["0"]=false,};
    
    NOT = function(a) -- Not Gate
    	return not a
    end;
    
    AND = function(a,b) -- And Gate
    	return a == true and b == true
    end;
    
    NAND = function(a,b) -- Not And Gate
    	return not a == true or not b == true
    end;
    
    OR = function(a,b) -- Or Gate
    	return a == true or b == true
    end;
    
    NOR = function(a,b) -- Not Gate
    	return not a == true and not b == true
    end;
    
    XOR = function(a,b) -- Exclusive Or Gate
    	return a == true and b == false or b == true and a == false
    end;
    
    XNOR = function(a,b) -- Exclusive Not Or Gate
    	return a == true and b == true or a == false and b == false
    end;
    
    HALFADDER = function(a,b) -- Adds two binary with no regard for overflow
    	return Logic.XOR(a,b), Logic.AND(a,b)
    end;
    
    HALFSUB = function(a,b) -- Subtracts two binary values with no regard for borrowing
	    return Logic.XOR(a,b), Logic.AND(Logic.NOT(a),b)
    end;
    
    FULLADDER = function(a,b,c) -- Adds two binary values with regard for overflow
    	local s,cr = Logic.HALFADDER(a,b)
    	local sum,cr2 = Logic.HALFADDER(s,c)
    	return sum, Logic.OR(cr,cr2)
    end;
    
    FULLSUB = function(a,b,c) -- Subtracts two binary values with  regard for borrowing
	    local s,br = Logic.HALFSUB(a,b)
	    local dif,br2 = Logic.HALFSUB(s,c)
	    return dif, Logic.OR(br,br2)
    end;
    
    TOBINARY = function(n) -- changes a number to a binary string
        local b = ""
        if n ~= 0 then
            while n >= 1 do
                if n%2 == 0 then
                    n = n/2
                    b = b..0
                else
                    n = (n-1)/2
                    b = b..1
                end
            end
        else
            b = "0"
        end
        b = string.reverse(b)
        return b
    end;
    
    VALUECHECK = function(a,n) -- checks the value of a binary number
	    local values = {}
	    for i = 1,#Logic.TOBINARY(a) do
	    	if string.reverse(Logic.TOBINARY(a)):sub(i,i) == "0" then
	    		table.insert(values, false)
	    	else
	    		table.insert(values, true)
	    	end
	    end
	    if n > #values then
	    	n = #values
	    end
	    return values[n]
    end;
    
    BINVALUECHECK = function(a) -- checks the value of a binary bit
	    if a:sub(1,1) == "0" then
		    return false
	    else
	    	return true
	    end
    end;
    
    LENCHECK = function(a) --checks the length of a number in binary
	local values = {}
	    for i = 1,#Logic.TOBINARY(a) do
	    	if string.reverse(Logic.TOBINARY(a)):sub(i,i) == "0" then
	    		table.insert(values, '')
	    	else
	    		table.insert(values, '')
	    	end
	    end
	    return #values
    end;
    
    Binlencheck = function(a, systest) --(Depreciated) (only thing you could really use it for is testing these functions)
    	local values = {}
    	for i = 1,#a do
    		if a:sub(i,i) == "0" then
    			table.insert(values, '')
    		else
    			table.insert(values, '')
    		end
        end
        if systest == false or systest == nil then
            print("pal the lenth of a bit is 1 fyi")
        end
    	return #values -- its 1
    end;
        
    ToTFString = function(str) -- Changes a binary string to a True False string
    	local ot
    	local out = ""
    	local rstr = str:reverse()
    	for i =1,#str do
    		ot = Logic.BINVALUECHECK(rstr:sub(i,i))
    		if ot == true then
      		out = tostring(ot).." ,"..out
    		else
    			out = tostring(ot)..","..out
    		end
    	end
    return out
    end;
    
    ToBINString = function(str) -- changes a True false string to binary string
    	local out = ""
    	local ot
    	local amount = (#str/6)
    	for i =1,#str do
    		if str:sub(i,i+5) == "false," then
    			out = out..0
    		elseif str:sub(i,i+5) == "true ," then
    			out = out..1
    		end
    	end
    	return out
    end;
    
    ADDER = function(a,b,n) --Adds 2 values
      	local overflow = false
      	local out = ""
      	local of
      	local ot
      	a = string.reverse(Logic.TOBINARY(a))
      	b = string.reverse(Logic.TOBINARY(b))
      	if n > #a and b then
      		if #a > #b then
      			n = #a
      			while #b < #a do
      				b = b..0
      			end
      		else
      		n = #b
      		while #b > #a do
      			a = a..0
      		end
      	end
      end
      for i = 1,n do
      	ot,of = Logic.FULLADDER(Logic.BINVALUECHECK(a:sub(i,i)),Logic.BINVALUECHECK(b:sub(i,i)),overflow)
      	if of == true then
      		overflow = true
      	else
      		overflow = false
      	end
    		if ot == true then
      		out = tostring(ot).." ,"..out
    		else
    			out = tostring(ot)..","..out
    		end
      end
      if overflow then
      	out = "true ,"..out
      end
      return Logic.ToBINString(out)
    end;
    
    SUBTRACTER = function(a,b,n) --Subtracts 2 values (no negative values so a must be greater than b)
      	local borrow = false
      	local out = ""
      	local of
      	local ot
      	a = string.reverse(Logic.TOBINARY(a))
      	b = string.reverse(Logic.TOBINARY(b))
      	if n > #a and b then
      		if #a > #b then
      			n = #a
      			while #b < #a do
      				b = b..0
      			end
      		else
      		n = #b
      		while #b > #a do
      			a = a..0
      		end
      	end
      end
      for i = 1,n do
      	ot,of = Logic.FULLSUB(Logic.BINVALUECHECK(a:sub(i,i)),Logic.BINVALUECHECK(b:sub(i,i)),borrow)
      	if of == true then
      		borrow = true
      	else
      		borrow = false
      	end
    		if ot == true then
      		out = tostring(ot).." ,"..out
    		else
    			out = tostring(ot)..","..out
    		end
      end
      if borrow then
      	out = "true ,"..out
      end
      return Logic.ToBINString(out)
    end;
    
    --SYSTEM FUNCTIONS--
    SYSTEST = function() -- Function to test if every thing is working fine
      local gates,_,o1 = pcall(Logic.NOT,false) and pcall(Logic.AND,true,true) and pcall(Logic.OR,true,true) and pcall(Logic.NAND,true,true) and pcall(Logic.NOR,true,true) and pcall(Logic.XOR,true,true) and pcall(Logic.XNOR,true,true),pcall(Logic.NOT,false)
      local halfop,_,o2 = pcall(Logic.HALFADDER,true,true) and pcall(Logic.HALFSUB,true,true),pcall(Logic.HALFADDER,true,true)
      local fullop,_,o3 = pcall(Logic.FULLSUB,false,false,true) and pcall(Logic.FULLADDER,false,true,true),pcall(Logic.FULLSUB,false,false,true)
      local check,_,o4 = pcall(Logic.Binlencheck,"0",true) and pcall(Logic.LENCHECK,10) and pcall(Logic.BINVALUECHECK,"1") and pcall(Logic.VALUECHECK,10,1),pcall(Logic.Binlencheck,"0",true)
      local tfstring,_,o5 = pcall(Logic.ToTFString,"1111") and pcall(Logic.ToBINString,'true ,','true ,','true ,','true ,'),pcall(Logic.ToBINString,'true ,','true ,','true ,','true ,')
    
    	if gates == true and halfop == true and fullop == true and check == true and tfstring == true and o1 ~= nil and o2 ~= nil and o3 ~= nil and o4 ~= nil and o5 ~= nil then
    		print("No errors with this version")
    	end
    	print("Error Status Check: ")
    	print("Gate functions Working?: "..tostring(gates),"","\t\treturns: "..tostring(o1))
    	print("Half Operation functions Working?: "..tostring(halfop),"","returns: "..tostring(o2))
    	print("Full Operation functions Working?: "..tostring(fullop),"","returns: "..tostring(o3))
    	print("Value Check functions Working?: "..tostring(check),"","returns: "..tostring(o4))
    	print("TFstring functions Working?: "..tostring(tfstring),"","\treturns: "..tostring(o5))
    end
}

return Logic