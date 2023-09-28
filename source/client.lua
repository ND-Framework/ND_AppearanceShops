local wardrobeId = "ND_AppearanceShops:wardrobe"
local wardrobeSelectedId = ("%s_selected"):format(wardrobeId)
local wardrobe = json.decode(GetResourceKvpString(wardrobeId)) or {}
local currentOpenWardrobe

local function inputOutfitName()
    local input = lib.inputDialog("Save current outfit", {"Outfit name:"})
    local name = input?[1]
    if name and name ~= "" then
        return name
    end
end

local function saveWardrobe(name)
    if not name then return end
    local appearance = exports["fivem-appearance"]:getPedAppearance(cache.ped)
    appearance.hair = nil
    appearance.headOverlays = nil
    appearance.tattoos = nil
    appearance.faceFeatures = nil
    appearance.headBlend = nil
    wardrobe[#wardrobe+1] = {
        name = name,
        appearance = appearance
    }
    return true
end

local function getWardrobe()
    local options = {
        {
            title = "Save current outfit",
            icon = "fa-solid fa-floppy-disk",
            onSelect = function()
                saveWardrobe(inputOutfitName())
            end
        }
    }
    for i=1, #wardrobe do
        local info = wardrobe[i]
        options[#options+1] = {
            title = info.name,
            arrow = true,
            onSelect = function()
                currentOpenWardrobe = i
                lib.showContext(wardrobeSelectedId)
            end
        }
    end
    return options
end

local function openWardrobe()
    lib.registerContext({
        id = wardrobeId,
        title = "Outfits",
        options = getWardrobe()
    })
    lib.showContext(wardrobeId)
end

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

lib.registerContext({
    id = wardrobeSelectedId,
    title = "Outfits",
    menu = wardrobeId,
    options = {
        {
            title = "Wear",
            icon = "fa-solid fa-shirt",
            onSelect = function()
                local selected = wardrobe[currentOpenWardrobe]
                if not selected then return end
                exports["fivem-appearance"]:setPedAppearance(cache.ped, selected.appearance)
            end
        },
        {
            title = "Edit name",
            icon = "fa-solid fa-pen-to-square",
            onSelect = function()
                local selected = wardrobe[currentOpenWardrobe]
                if not selected then return end
                selected.name = inputOutfitName()
            end
        },
        {
            title = "Remove",
            icon = "fa-solid fa-trash-can",
            onSelect = function()
                local selected = wardrobe[currentOpenWardrobe]
                if not selected then return end
                local alert = lib.alertDialog({
                    header = "Remove outfit?",
                    content = ("Are you sure you'd like to remove %s?"):format(selected.name),
                    centered = true,
                    cancel = true
                })
                print(alert)
                if alert ~= "confirm" then return end
                table.remove(wardrobe, currentOpenWardrobe)
            end
        }
    }
})

for i=1, #Config do
    local info = Config[i]
    for j=1, #info.locations do
        local location = info.locations[j]
        local options = {
            {
                name = "nd_core:appearanceShops",
                icon = "fa-solid fa-bag-shopping",
                label = info.text,
                distance = 2.0,
                onSelect = function(data)
                    startChange(location.change, info.appearance, i)
                end
            }
        }
        if info.appearance?.components then
            options[#options+1] = {
                name = "nd_core:appearanceOutfit",
                icon = "fa-solid fa-shirt",
                label = "View outfits",
                distance = 2.0,
                onSelect = function(data)
                    openWardrobe()
                end
            }
        end
        NDCore.createAiPed({
            model = location.model,
            coords = location.worker,
            distance = 25.0,
            blip = info.blip,
            options = options,
            anim = {
                dict = "anim@amb@casino@valet_scenario@pose_d@",
                clip = "base_a_m_y_vinewood_01"
            }
        })
    end
end

AddEventHandler("onResourceStop", function(resource)
    if resource ~= cache.resource then return end
    SetResourceKvp(wardrobeId, json.encode(wardrobe))
end)
