# ezSave instructions

## Functions:

##### ezSave.Save(Player, Key, WhatToSave)
#### Usage:
1. Parameter: Player instance. (Player that we are saving it's data)
2. Parameter: Key string. Key must be same when loading data. For example I saved my cash in to "Cash" key. Then I should load it with "Cash" key again.
3. Parameter: This is exactly same as it's name. Can be string, number, table.,

### Results:

Saves player's data.
##### ezSave.Load(Player, Key)
### Usage: 

1. Parameter: Player instance. (Player that we are loading it's data)
2. Parameter: Key string. Key must be same when saving data. For example I saved my cash in to "Cash" key. Then I should load it with "Cash" key again.
### Results:
Loads player's data.
(To do something with the player's data, then you should define a variable to ezSave.res after running the load function. ezSave.res is always equals to last loaded data.)

##### ezSave.getServerData(Key)

1. Parameter: Key of data. (String)

### Results:

Lists the data's of all players in a server with given key.

Print example:

![image](https://user-images.githubusercontent.com/82947366/125311247-efc25c80-e33b-11eb-9f9d-41b114011294.png)

 The last 500 is equals to my data with key "Cash"

(To do something with this list, then you should define a variable to ezSave.svd after running the getServerData function. )
ezSave.svd table example:
{

[1] = {"Z_lqify","Key","loaded data"}

}

## Configuration Variables

##### ezSave.Data_Key
GetDataStore(ezSave.Data_Key)
Change Data_Key to something different to reset all of the datas.


## Mods
Yes, there are also mods in ezSave.

![image](https://user-images.githubusercontent.com/82947366/125324325-7b41ea80-e348-11eb-8147-afabd55767b1.png)

All of the mods are located in mods folder.
There is a pre-installed mod in the Mods folder. It's called ezStats. Which is nearly best way to make saveable or not, fully configurable leaderstat system.


Configuration for ezStats:

```lua
local conf = {}

conf.leaderstats = {
	
	
--[[ Args: ["STAT_NAME"] = {"Type",amount on first join, true or false (true if it is gonna save false for opposite.) } ]]
	["Cash"] = {"IntValue", 0,true},
	["Gems"] = {"IntValue", 5,false},
	
	
}
conf.save_key = "leaderstats"



return conf
```

Yes! It's so easy to create a leaderstat by ezStat mod.






