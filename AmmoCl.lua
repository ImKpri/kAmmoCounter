
local function DrawText3DSecond(x,y,z, text)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    SetTextScale(0.30, 0.30)
    SetTextFont(4)
    SetTextProportional(0)
    SetTextColour(255, 0, 0, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
end


local weaponAmmo = 0
local currentWeapon = ""

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()

        if IsPedArmed(playerPed, 6) then
            if not IsPlayerFreeAiming(PlayerId()) then
                local boneIndex = GetPedBoneIndex(playerPed, 57005)
                local coords = GetWorldPositionOfEntityBone(playerPed, boneIndex)
                local _, _, z = table.unpack(coords)
                local ammoInClip, ammoInClipMax = GetAmmoInClip(playerPed, GetSelectedPedWeapon(playerPed))
                DrawText3DSecond(coords.x, coords.y, coords.z + 0.2, "~b~" .. ammoInClipMax .. " / 250")
            end
        end
    end
end)


