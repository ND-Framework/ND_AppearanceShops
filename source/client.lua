local ped
local pedCoords
local notified = false
local found = false

CreateThread(function()
    for _, store in pairs(config) do
        if store.blip then
            for _, location in pairs(store.locations) do
                local blip = AddBlipForCoord(location)
                SetBlipSprite(blip, store.blip.sprite)
                SetBlipColour(blip, 3)
                SetBlipScale(blip, 0.65)
                SetBlipAsShortRange(blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(store.blip.name)
                EndTextCommandSetBlipName(blip)
            end
        end
    end
    while true do
        Wait(500)
        ped = PlayerPedId()
        pedCoords = GetEntityCoords(ped)
    end
end)

CreateThread(function()
    local wait = 500
    while true do
        Wait(wait)
        for id, store in pairs(config) do
            for _, location in pairs(store.locations) do
                local dist = #(location - pedCoords)
                if dist < 12.0 then
                    found = true
                    DrawMarker(1, location.x, location.y, location.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.5, 2.5, 0.5, 40, 140, 255, 150, false, false, 2, false, nil, nil, false)
                    if dist < 1.2 then
                        if not notified then
                            notified = true
                            lib.showTextUI("[E] - " .. store.notification)
                        end
                        if IsControlJustPressed(0, 51) then
                            exports["fivem-appearance"]:startPlayerCustomization(function(appearance)
                                if appearance then
                                    local clothing = {
                                        model = GetEntityModel(ped),
                                        tattoos = exports["fivem-appearance"]:getPedTattoos(ped),
                                        appearance = exports["fivem-appearance"]:getPedAppearance(ped)
                                    }
                                    Wait(1000)
                                    TriggerServerEvent("ND:updateClothes", clothing)
                                    TriggerServerEvent("ND_ClothingStore:clothingPurchase", id)
                                end
                            end, store.options)
                        end
                    elseif notified then
                        notified = false
                        lib.hideTextUI()
                    end
                    break
                end
            end
            if found then
                found = false
                wait = 0
                break
            else
                wait = 500
            end
        end
    end
end)