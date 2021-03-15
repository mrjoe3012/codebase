local Utils = {}

local Utils = {}

function Utils.linearSearch(list, condition, returnAmount)
	returnAmount = returnAmount or math.huge
	
	assert(type(list) == "table", string.format("Invalid argument #1 to linearSearch. Table expected got '%s'", type(list)))
	assert(type(condition) == "function", string.format("Invalid argument #2 to linearSearch. Function expected got '%s'", type(condition)))
	assert(type(returnAmount) == "number", string.format("Invalid argument #3 to linearSearch. Number expected got '%s'", type(returnAmount)))
	assert(returnAmount > 0, string.format("Invalid argument #3 to linearSearch. Argument must be greater than 0"))
	
	local results = {}
	
	for k,v in pairs(list) do
		if condition(k,v) then
			table.insert(results, k)
		end
		
		if #results == returnAmount then break end
		
	end
	
	if #results == 0 then results = nil
	elseif #results == 1 then results = results[1] end
	
	return results
end

function Utils.findMin(t, index)
	local min, indiex = math.huge, nil
	
	for k,v in pairs(t) do
		local value = index(k)
		if value < min then min = value i = k end
	end
		
	return i
end

function Utils.findMax(t, index)
	local max, i = -math.huge, nil

	for k,v in pairs(t) do
		local value = index(k)
		if value > max then max = value i = k end
	end

	return i
end

function Utils.stringSplit(inputstr, sep)
    sep = sep or ","
    Utils.checkAgs("stringSplit", {[inputstr]="string",[sep]="string"})
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
            table.insert(t, str)
    end
    return t
end


function Utils.checkArgs(funcName, paramsAndTypes)
	
	assert(type(funcName) == "string", string.format("Bad argument #1 to checkArgs. String expected got '%s'", type(funcName)))
	assert(type(paramsAndTypes) == "table", string.format("Bad argument #2 to checkArgs. Table expected got '%s'", type(paramsAndTypes)))
	
	local i = 1
	
	for param, paramType in pairs(paramsAndTypes) do
		assert(type(param)==paramType, string.format("Bad argument #%d to %s. %s expected got '%s'", i, funcName, paramType, type(param)))
		i = i + 1
	end
	
end

return Utils

return Utils