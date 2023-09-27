local function startChange(coords, options, i)
    local ped = cache.ped
    local oldAppearance = {
        model = GetEntityModel(ped),
        tattoos = exports["fivem-appearance"]:getPedTattoos(ped),
        appearance = exports["fivem-appearance"]:getPedAppearance(ped)
    }
    SetEntityCoords(ped, coords.x, coords.y, coords.z-1.0)
    SetEntityHeading(ped, coords.w)
    Wait(250)
    exports["fivem-appearance"]:startPlayerCustomization(function(appearance)
        if not appearance then return end

        ped = PlayerPedId()
        local clothing = {
            model = GetEntityModel(ped),
            tattoos = exports["fivem-appearance"]:getPedTattoos(ped),
            appearance = exports["fivem-appearance"]:getPedAppearance(ped)
        }

        if not lib.callback.await("ND_AppearanceShops:clothingPurchase", false, i, clothing) then
            exports["fivem-appearance"]:setPlayerModel(oldAppearance.model)
            ped = PlayerPedId()
            exports["fivem-appearance"]:setPedTattoos(ped, oldAppearance.tattoos)
            exports["fivem-appearance"]:setPedAppearance(ped, oldAppearance.appearance)
        end
    end, options)
end

for i=1, #Config do
    local info = Config[i]
    for j=1, #info.locations do
        local location = info.locations[j]
        NDCore.createAiPed({
            model = location.model,
            coords = location.worker,
            distance = 25.0,
            blip = info.blip,
            anim = {
                dict = "anim@amb@casino@valet_scenario@pose_d@",
                clip = "base_a_m_y_vinewood_01"
            },
            options = {
                {
                    name = "nd_core:appearanceShops",
                    icon = "fa-solid fa-bag-shopping",
                    label = info.text,
                    distance = 2.0,
                    onSelect = function(data)
                        startChange(location.change, info.appearance, i)
                    end
                }
            },
        })
    end
end
