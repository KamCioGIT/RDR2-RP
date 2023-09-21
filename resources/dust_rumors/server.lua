RedEM = exports["redem_roleplay"]:RedEM()

RegisterServerEvent('rumors:checkplayer')
AddEventHandler('rumors:checkplayer', function(index) 
	local _source = source

    if GetPlayerPed(index) == _source then
        print("false")
        return false
    else if IsPedAPlayer(index) == false then 
        print("false")
        return false
    else then 
        print("true")
        return true 
    end
end)
