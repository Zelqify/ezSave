local ezSave = {}


ezSave.Data_Key = "1" -- Change this everytime to reset all of the player datas.


















ezSave.res = nil
ezSave.svd = {}

local data = game:GetService("DataStoreService"):GetDataStore(ezSave.Data_Key)



function ezSave.getServerData(Key)
	ezSave.svd = {}
	for index,player in pairs(game.Players:GetChildren()) do
		ezSave.svd[index] = {player.Name, Key, data:GetAsync(player.UserId .. Key)}
		warn("[" .. index .. "] = " .. player.Name .. " = KEY[" .. Key .. "] = " .. data:GetAsync(player.UserId .. Key))
		
		
	end

end

function ezSave.Save(Player, Key, WhatToSave)
	
	if Player ~= nil and Key ~= nil and WhatToSave ~= nil then
		local success,error = pcall(function()
			
			data:SetAsync(Player.UserId .. Key, WhatToSave)
			
			
		end)
		if success then
			warn("ezSave successfully saved " .. Player.Name .. "'s Data.")
		else
			warn("ezSave has failed to save datas: " .. error)
		end
	else
		warn("ezSave has failed to save datas: Some of the 3 arguments are nil.")
		return
	end
	
	
end

function ezSave.Load(Player, Key)
	
	if Player ~= nil and Key ~= nil then
		
		local success,error = pcall(function()

			ezSave.res = data:GetAsync(Player.UserId .. Key)
			
			if ezSave.res == nil then
				warn(Player.Name .. "'s datas are loaded as nil (unknown)")
	
			end		
			

		end)
		if success then
			warn("ezSave successfully loaded " .. Player.Name .. "'s Data.")
			
		else
			warn("ezSave has failed to load datas: " .. error)
		end
		
		
	else
		warn("ezSave has failed to load datas: Some of the 2 arguments are nil.")
		
	end
	
end
return ezSave






