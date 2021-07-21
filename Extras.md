## Extras

### Saving multiple data without having same key.
Normally people save multiple data's with tables (same key for everything) or line by line.
Now, I'll show you how to save multiple data's auto with loops and tables.

First of all we need to require our module from our script.
```lua
local ezSave = require(game.ServerScriptService.ezSave)
```

Great now we are going to do a table which lists all keys and all of value locations. Also we need a PlayerRemoving event to save it when player leaves the game.
```lua

local ezSave = require(game.ServerScriptService.ezSave)
game.Players.PlayerRemoving:Connect(function(Player)

local Keys = {

"Cash" = Player:WaitForChild("Cash").Value,
"Gems" = Player:WaitForChild("Gems").Value,

}



end)
```

Alright now we need to code the loop and save.

```lua


local ezSave = require(game.ServerScriptService.ezSave)
game.Players.PlayerRemoving:Connect(function(Player)

local Keys = {

"Cash" = Player:WaitForChild("Cash").Value,
"Gems" = Player:WaitForChild("Gems").Value,

}
 
for key,data in pairs(Keys) do

ezSave.Save(Player, key, data)
end


end)

```

This loop is working like this, so there is a table called Keys. 
When the code is looping trough Keys, there are key and data parameters. "key" is changing 2 times becausse there is 2 values in our table.
Thr loop is also working 2 times cause there is 2 values as I said before. key equals to "Cash" in first loop and it equals to "Gems" in second loop.
data is working same aswell. It changes too. But it's Player's Cash.Value in first loop and it's Player's Gems.Value in second loop.
In each loop it saves key and data to player.

If it doesn't work, ezSave module will throw an error.


## Using DS2:GetAsync() on a data that is saved with ezSave.Save().
Pretty easy to do. When you are saving with a custom key like, "Cash", "Gems" etc..
Actual key isn't Cash or Gems. This is the key that ezSave uses to store your data in ezSave's own small system.
Your key is used in communication between ezSave functions. Even getServerData doesn't print your actual save key.
Such as an upcoming function called listAllDatas(Player) (not released) prints name of your custom key and value that is saved in. If it's unknown then, it won't print the key and the value.
So the real key is what?
Easy. Many people uses UserId. UserId never does change. Each player has a unique id. So yeah here's an example: saving with ezSave and loading with datastoreservice2.

SAVE:
```lua
local ezSave = require(game.ServerScriptService.ezSave)

game.Players.PlayerRemoving:Connect(function(player)

ezSave.Save(player, "cash", player.Cash.Value)

end)
```
LOAD:
```lua
local dss = game:GetService("DataStoreService"):GetDataStore("DATA")
game.Players.PlayerAdded:Connect(function(player)

local playercash = player:WaitForChild("Cash")
playercash.Value = dss:GetAsync(player.UserId .. "cash") or 0
end)
```
yup, it's basically "player.UserId .. string_key".





