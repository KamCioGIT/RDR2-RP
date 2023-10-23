ComponentsClothesMale = {}
ComponentsClothesFemale = {}
ComponentsBodyMale = {}
ComponentsBodyFemale = {}
ClothesCache = {}
OldClothesCache = {}
function reversedipairsiter(t, i)
    i = i - 1
    if i ~= 0 then
        return i, t[i]
    end
end

function reversedipairs(t)
    return reversedipairsiter, t, #t + 1
end

function pairsByKeys (t, f)
    local a = {}
    for n in pairs(t) do
        table.insert(a, n)
    end
    table.sort(a, f)
    local i = 0      -- iterator variable
    local iter = function ()   -- iterator function
        i = i + 1
        if a[i] == nil then
            return nil
        else
            return a[i], t[a[i]]
        end
    end
    return iter
end

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

function CalculatePrice()
	local price = 0
		if IsPedMale(PlayerPedId()) then
			for k,v in pairs(clothes_list["male"]) do
				if OldClothesCache[k].model ~= ClothesCache[k].model or OldClothesCache[k].texture ~= ClothesCache[k].texture then
					if ClothesCache[k].model > 0 then
						price = price + Config.Price[k]
					end
				end
			end
		else
			for k,v in pairs(clothes_list["female"]) do
				if OldClothesCache[k].model ~= ClothesCache[k].model or OldClothesCache[k].texture ~= ClothesCache[k].texture then
					if ClothesCache[k].model > 0 then
						price = price + Config.Price[k]
					end
				end
			end
		
		end
		return price
end

function CalculatePriceHat()
	local price = 0
		if IsPedMale(PlayerPedId()) then
				if OldHatCache["hats"].model ~= HatCache["hats"].model or OldHatCache["hats"].texture ~= HatCache["hats"].texture then
					if HatCache["hats"].model > 0 then
						price = price + Config.Price["hats"]
					end
				end
		else
				if OldHatCache["hats"].model ~= HatCache["hats"].model or OldHatCache["hats"].texture ~= HatCache["hats"].texture then
					if HatCache["hats"].model > 0 then
						price = price + Config.Price["hats"]
					end
				end
		
		end
		return price
end

function CalculatePriceMask()
	local price = 0
		if IsPedMale(PlayerPedId()) then
				if OldMaskCache["masks"].model ~= MaskCache["masks"].model or OldMaskCache["masks"].texture ~= MaskCache["masks"].texture then
					if MaskCache["masks"].model > 0 then
						price = price + Config.Price["masks"]
					end
				end
		else
				if OldMaskCache["masks"].model ~= MaskCache["masks"].model or OldMaskCache["masks"].texture ~= MaskCache["masks"].texture then
					if MaskCache["masks"].model > 0 then
						price = price + Config.Price["masks"]
					end
				end
		
		end
		return price
end


function NativeSetPedComponentEnabled(ped, componentHash, immediately, isMp)
    local categoryHash = NativeGetPedComponentCategory(not IsPedMale(ped), componentHash)
    -- print(componentHash, categoryHash, NativeGetMetapedType(ped))

    NativeFixMeshIssues(ped, categoryHash)

    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, componentHash, immediately, isMp, true)
    NativeUpdatePedVariation(ped)
end

function NativeGetPedComponentCategory(isFemale, componentHash)
    return Citizen.InvokeNative(0x5FF9A878C3D115B8, componentHash, isFemale, true)
end


function NativeFixMeshIssues(ped, categoryHash)
    Citizen.InvokeNative(0x59BD177A1A48600A, ped, categoryHash)
end



function NativeUpdatePedVariation(ped)
    Citizen.InvokeNative(0x704C908E9C405136, ped)
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false)
    while not NativeHasPedComponentLoaded(ped) do
        Wait(1)
    end
end

function NativeHasPedComponentLoaded(ped)
    return Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ped)
end

function SetMetaPedTag(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    Citizen.InvokeNative(0xBC6DF00D7A4A6819, ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
end
function UpdatePedVariation(ped)
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true) -- UNKNOWN "Fixes outfit"- always paired with _UPDATE_PED_VARIATION
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false) -- _UPDATE_PED_VARIATION
end

function UpdateCustomClothes(playerPed, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    while not NativeHasPedComponentLoaded(playerPed) do
        Wait(0)
    end
    local playerPed = PlayerPedId()
    local _drawable = drawable
    local _albedo = albedo
    local _normal = normal
    local _material = material
    local _palette = palette
    local _tint0 = tonumber(tint0)
    local _tint1 = tonumber(tint1)
    local _tint2 = tonumber(tint2)

    SetMetaPedTag(playerPed, _drawable, _albedo, _normal, _material, _palette, _tint0, _tint1, _tint2)
    UpdatePedVariation(playerPed)
end

function UpdateShopItemWearableState(ped, shopItemHash, wearableStateHash, isMultiplayer)
    Citizen.InvokeNative(0x66B957AAC2EAAEAB, ped, shopItemHash, wearableStateHash, 0, isMultiplayer, 1)
end
