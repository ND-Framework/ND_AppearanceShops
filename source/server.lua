NDCore = exports["ND_Core"]:GetCoreObject()

NDCore.Functions.VersionChecker("ND_AppearanceShops", GetCurrentResourceName(), "https://github.com/ND-Framework/ND_AppearanceShops", "https://raw.githubusercontent.com/ND-Framework/ND_AppearanceShops/main/ND_Core/fxmanifest.lua")

RegisterNetEvent("ND_ClothingStore:clothingPurchase", function(id)
    local player = source
    NDCore.Functions.DeductMoney(config[id].price, player, "cash")
end)