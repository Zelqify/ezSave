
local main = require(script.Parent.Parent)
local settingss = script:WaitForChild("Config")
local set = require(settingss.ezStatsConfig)
game.Players.PlayerAdded:Connect(function(Player)
	
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = Player
	for i,v in pairs(set.leaderstats) do
		
		local new = Instance.new(v[1])
		new.Name = i
		new.Parent = leaderstats
		
		if v[3] == true then
			
			
		main.Load(Player, set.save_key)
		local load = main.res
		new.Value = load[i] or v[2]
		else

	
		new.Value = v[2]
		end
	
		
		
	end
	
	
	
end)

game.Players.PlayerRemoving:Connect(function(Player)
	
	
	local saveTable = {}
	
	
	for i,v in pairs(Player.leaderstats:GetChildren()) do
		
		saveTable[v.Name] = v.Value
		
		
	end
	
	
	main.Save(Player, set.save_key, saveTable)
	
	
	
	
	
end)
