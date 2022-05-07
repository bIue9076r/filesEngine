System ={
    
    ConsoleLog = {};

    ConsoleFile = io.open("SystemLog.txt","a+");
    
    Write = function(n)
    	System.ConsoleFile = io.open("SystemLog.txt","a+")
        io.output(System.ConsoleFile)
    	table.insert(System.ConsoleLog,n)
    	io.write("\n"..n)
    	io.close()
        return
    end;
    
    Out = function()
        for i, v in ipairs(System.ConsoleLog) do
            print(i,v)
        end	
        return
    end;
}

return System