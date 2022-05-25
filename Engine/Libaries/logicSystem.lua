System ={
	
	ConsoleLog = {};

	ConsoleFile = io.open("SystemLog.txt","a+");
	
	Write = function(n)
		ms = os.date("%x %X").." "..n
		System.ConsoleFile = io.open("SystemLog.txt","a+")
		io.output(System.ConsoleFile)
		table.insert(System.ConsoleLog,ms)
		io.write("\n"..ms)
		io.close()
	end;
	
	Warn = function(n)
		ms = os.date("%x %X").." (WARNING) "..n
		System.ConsoleFile = io.open("SystemLog.txt","a+")
		io.output(System.ConsoleFile)
		table.insert(System.ConsoleLog,ms)
		io.write("\n"..ms)
		io.close()
	end;
	
	Out = function()
		for i, v in ipairs(System.ConsoleLog) do
			print(i,v)
		end
	end;
}

return System