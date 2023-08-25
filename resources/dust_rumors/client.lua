local closestPed = nil

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3500)
        local itemSet = CreateItemset(true)
        local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), 5.0, itemSet, 1, Citizen.ResultAsInteger())
        -- number xPos, number yPox, number zPos, float distance, int itemSet, int entityType

        print(size)

        if size > 0 then
            for index = 0, size - 1 do
                local entity = GetIndexedItemInItemset(index, itemSet)
                local entityPos = GetEntityCoords(entity)

                local id = GetPedIndexFromEntityIndex(entity)
                boneCoord = id.GetBoneCoord(Bone.SKEL_Head);
                DrawText3D(boneCoord.x, boneCoord.y + 0.5, boneCoord.z, "MONSTRE")
            end
        end

        if IsItemsetValid(itemSet) then
            DestroyItemset(itemSet)
        end
    end
end)


function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=GetScreenCoordFromWorldCoord(x, y, z)
	local px,py,pz=table.unpack(GetGameplayCamCoord())  
	local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
	local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
	if onScreen then
		SetTextScale(0.30, 0.30)
		SetTextFontForCurrentCommand(0)
		SetTextColor(255, 255, 255, 255)
		SetTextCentre(1)
		SetTextDropshadow(1, 1, 0, 0, 200)
		DisplayText(str,_x,_y)
		local factor = (string.len(text)) / 225
	end
end