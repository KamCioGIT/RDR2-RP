RedEM = exports["redem_roleplay"]:RedEM()

RegisterServerEvent('rumors:checkplayer')
AddEventHandler('rumors:checkplayer', function(index)
    print(Citizen.InvokeNative(0x404794CA, entity)) 
    return Citizen.InvokeNative(0x404794CA, entity)
end)
