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

function CalculatePriceEyes()
	local price = 0
		if IsPedMale(PlayerPedId()) then
				if OldEyesCache["eyewear"].model ~= EyesCache["eyewear"].model or OldEyesCache["eyewear"].texture ~= EyesCache["eyewear"].texture then
					if EyesCache["eyewear"].model > 0 then
						price = price + Config.Price["eyewear"]
					end
				end
		else
				if OldEyesCache["eyewear"].model ~= EyesCache["eyewear"].model or OldEyesCache["eyewear"].texture ~= EyesCache["eyewear"].texture then
					if EyesCache["eyewear"].model > 0 then
						price = price + Config.Price["eyewear"]
					end
				end
		
		end
		return price
end

function CalculatePriceDBagues()
	local price = 0
		if IsPedMale(PlayerPedId()) then
				if OldDBaguesCache["jewelry_rings_right"].model ~= DBaguesCache["jewelry_rings_right"].model or OldDBaguesCache["jewelry_rings_right"].texture ~= DBaguesCache["jewelry_rings_right"].texture then
					if DBaguesCache["jewelry_rings_right"].model > 0 then
						price = price + Config.Price["jewelry_rings_right"]
					end
				end
		else
				if OldDBaguesCache["jewelry_rings_right"].model ~= DBaguesCache["jewelry_rings_right"].model or OldDBaguesCache["jewelry_rings_right"].texture ~= DBaguesCache["jewelry_rings_right"].texture then
					if DBaguesCache["jewelry_rings_right"].model > 0 then
						price = price + Config.Price["jewelry_rings_right"]
					end
				end
		
		end
		return price
end
function CalculatePriceGBagues()
	local price = 0
		if IsPedMale(PlayerPedId()) then
				if OldGBaguesCache["jewelry_rings_left"].model ~= GBaguesCache["jewelry_rings_left"].model or OldGBaguesCache["jewelry_rings_left"].texture ~= GBaguesCache["jewelry_rings_left"].texture then
					if GBaguesCache["jewelry_rings_left"].model > 0 then
						price = price + Config.Price["jewelry_rings_left"]
					end
				end
		else
				if OldGBaguesCache["jewelry_rings_left"].model ~= GBaguesCache["jewelry_rings_left"].model or OldGBaguesCache["jewelry_rings_left"].texture ~= GBaguesCache["jewelry_rings_left"].texture then
					if GBaguesCache["jewelry_rings_left"].model > 0 then
						price = price + Config.Price["jewelry_rings_left"]
					end
				end
		
		end
		return price
end
function CalculatePriceAccBottes()
	local price = 0
		if IsPedMale(PlayerPedId()) then
				if OldAccBottesCache["boot_accessories"].model ~= AccBottesCache["boot_accessories"].model or OldAccBottesCache["boot_accessories"].texture ~= AccBottesCache["boot_accessories"].texture then
					if AccBottesCache["boot_accessories"].model > 0 then
						price = price + Config.Price["boot_accessories"]
					end
				end
		else
				if OldAccBottesCache["boot_accessories"].model ~= AccBottesCache["jewelry_boot_accessoriesrings_left"].model or OldAccBottesCache["boot_accessories"].texture ~= AccBottesCache["boot_accessories"].texture then
					if AccBottesCache["boot_accessories"].model > 0 then
						price = price + Config.Price["boot_accessories"]
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
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true) -- UNKNOWN "Fixes outfit"- always paired with _UPDATE_PED_VARIATION
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

function FixIssues(target)
    if IsPedMale(target) then
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, target, 0, 0)
        NativeUpdatePedVariation(target)
        NativeSetPedComponentEnabled(target, tonumber(ComponentsMale["BODIES_UPPER"][1]), false, true, true)
        NativeSetPedComponentEnabled(target, tonumber(ComponentsMale["BODIES_LOWER"][1]), false, true, true)
        NativeSetPedComponentEnabled(target, tonumber(ComponentsMale["heads"][1]), false, true, true)
        NativeSetPedComponentEnabled(target, tonumber(ComponentsMale["eyes"][1]), false, true, true)
        texture_types["male"].albedo = GetHashKey("mp_head_mr1_sc08_c0_000_ab")
        Citizen.InvokeNative(0xD710A5007C2AC539, target, 0x1D4C528A, 0)
    else
        Citizen.InvokeNative(0x77FF8D35EEC6BBC4, target, 7, true)
        NativeUpdatePedVariation(target)
        NativeSetPedComponentEnabled(target, tonumber(ComponentsFemale["BODIES_UPPER"][1]), false, true, true)
        NativeSetPedComponentEnabled(target, tonumber(ComponentsFemale["BODIES_LOWER"][1]), false, true, true)
        NativeSetPedComponentEnabled(target, tonumber(ComponentsFemale["heads"][1]), false, true, true)
        NativeSetPedComponentEnabled(target, tonumber(ComponentsFemale["eyes"][1]), false, true, true)
        -- NativeSetPedComponentEnabled( target, 0x1EECD215, false, true, true)
        texture_types["female"].albedo = GetHashKey("mp_head_fr1_sc08_c0_000_ab")
    end
    Citizen.InvokeNative(0xD710A5007C2AC539, target, 0x3F1F01E5, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, target, 0xDA0E2C55, 0)
    NativeUpdatePedVariation(target)
end