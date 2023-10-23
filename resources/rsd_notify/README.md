### 🛠 Requirements

  [STANDLAONE]

### ✅ Main Features

- ALL NOTIFICATIONS YOU NEED
- NUI soon ...

### 🔧 Download & Installation

1. Download the latest version from your [keymaster]
2. Unzip the package and rename the file you want in [rsd_notify]
    - Make sure to rename the folder with the right name !
3. Add the sql table in your DB
4. Ensure the resource in your resources files like this > ensure [rsd_notify]
5. Configure what you want in the [Config.lua] file
6. Start the resource and it's ready.

### 🔧 HOW TU USE

```lua
--Order if you use the test command
--Just copy and paste the following triggers into your script

--CLIENT SIDE
1 = TriggerEvent("rsd_notify:NotifyLeftTool", "Text", 5000)
2 = TriggerEvent("rsd_notify:NotifLeftAdvanced", "Title", "Text", "scoretimer_textures", "scoretimer_generic_tick", 5000) --with directory & texture
3 = TriggerEvent("rsd_notify:NotifyRight", "Text", 5000)
4 = TriggerEvent("rsd_notify:NotifyRightAdvanced", "Text", "itemtype_textures", "itemtype_player_health", "COLOR_PURE_WHITE", 5000) --with directory & texture
5 = TriggerEvent("rsd_notify:NotifyBottom", "Text", 5000)
6 = TriggerEvent("rsd_notify:NotifyTop", "Text", 5000)
7 = TriggerEvent("rsd_notify:NotifyTopAdvanced", "Title", "Text", 5000)
8 = TriggerEvent("rsd_notify:NotifyCenter", "Text", 5000)

--SERVER SIDE
source = --Player you want them to have the notification, If it is for all players, put "-1" instead of "source"
1 = TriggerClientEvent("rsd_notify:NotifyLeftTool", source, "Text", 5000)
2 = TriggerClientEvent("rsd_notify:NotifLeftAdvanced", source, "Title", "Text", "scoretimer_textures", "scoretimer_generic_tick", 5000) --with directory & texture
3 = TriggerClientEvent("rsd_notify:NotifyRight", source, "Text", 5000)
4 = TriggerClientEvent("rsd_notify:NotifyRightAdvanced", source, "Text", "itemtype_textures", "itemtype_player_health", "COLOR_PURE_WHITE", 5000) --with directory & texture
5 = TriggerClientEvent("rsd_notify:NotifyBottom", source, "Text", 5000)
6 = TriggerClientEvent("rsd_notify:NotifyTop", source, "Text", 5000)
7 = TriggerClientEvent("rsd_notify:NotifyTopAdvanced", source, "Title", "Text", 5000)
8 = TriggerClientEvent("rsd_notify:NotifyCenter", source, "Text", 5000)

--EXEMPLE FOR ALL PLAYERS, ONLY IN SERVER SIDE
TriggerClientEvent("rsd_notify:NotifyLeftTool", -1, "Text", 5000)
```
For Colours >> https://github.com/femga/rdr3_discoveries/tree/master/useful_info_from_rpfs/colours
Notifications that use directory and texture, you can go here >> https://github.com/femga/rdr3_discoveries/tree/master/useful_info_from_rpfs/textures


If you want change colours of your text in your text:

  [~q~]= Default White
  [~e~]= Red
  [~t8~] = Light Red
  [~o~]/[~t4~] = Yellow
  [~d~]/[~t2~] = Orange
  [~m~]= Grey
  [~t~]= Light Grey
  [~v~]= Black
  [~u~]= Pink
  [~t5~] = Light Pink
  [~pa~] = Blue 
  [~t3~] = Light Blue
  [~t7~] = Dark Blue
  [~t1~] = Purple
  [~t6~] = Green

Exemple:
```lua
TriggerEvent("rsd_notify:NotifyLeftTool", "This test is ~e~red ~q~bro !", 5000)
--As you can see, I put the red colour with "~e~"in front of the word that I want to color and then I put the white colour with "~q~" that is the default colour
```

### 📈 INFO.

Requirements  | [STANDLAONE]
Support	      | [Discord](https://discord.gg/UsjAnRv48u)
Store	        | [Tebex](https://script.redstartrp.fr/)
Version	      | [1.0]


### © COPYRIGHT.

Powered & Copyrighted by [©StitProd]
©REDSTART
©RS DEVELOPMENT
©RS DEV