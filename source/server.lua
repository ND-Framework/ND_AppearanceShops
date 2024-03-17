lib.callback.register("ND_AppearanceShops:clothingPurchase", function(src, store, clothing)
    local store = Config[store]
    local player = NDCore.getPlayer(src)
    if not store or not player then return end

    local price = store.price
    if not price then return true end
    if not player.deductMoney("bank", price, store.blip.label) then
        player.notify({
            title = store.blip.label,
            description = ("Payment of $%d failed!"):format(price),
            position = "bottom",
            type = "error"
        })
        return
    end

    if clothing and type(clothing) == "table" then
        player.setMetadata("clothing", clothing)
    end
    player.notify({
        title = store.blip.label,
        description = ("Payment of $%d confirmed!"):format(price),
        position = "bottom",
        type = "success"
    })
    return true
end)

RegisterNetEvent("ND_AppearanceShops:updateAppearance", function(clothing)
    local src = source
    local player = NDCore.getPlayer(src)
    if not player then return end

    if clothing and type(clothing) == "table" then
        player.setMetadata("clothing", clothing)
    end
end)
