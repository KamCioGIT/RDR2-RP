RedEM = exports["redem_roleplay"]:RedEM()

RegisterServerEvent('rumors:checkplayer')
AddEventHandler('rumors:checkplayer', function(index) 
    if Citizen.InvokeNative(0x404794CA, entity) then 
        return true
    end
end)
