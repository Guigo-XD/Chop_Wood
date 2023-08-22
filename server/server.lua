RedEM = exports["redem_roleplay"]:RedEM()

RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterServerEvent('woodstump:CheckAxe')
AddEventHandler('woodstump:CheckAxe',function (scenario)
        local AxetemInfo = data.getItemData(Config.Axe)
        local AxeItemData = data.getItem(source, AxetemInfo.label)

        if TotalAxeitem > 1 then
            local WoodItemInfo = data.getItemData(Config.Wood)
            local WoodItemData = data.getItem(source, WoodItemInfo.label)
        
            if TotalWoodItem > 1 then
                TriggerClientEvent('woodstump:Chop',scenario)
            else
                TriggerClientEvent("redemrp_notification:start", source, 'você não possui '..WoodItemInfo.label..' para usar', 5)
            end
    else         
        TriggerClientEvent("redem_roleplay:NotifyRight", source, 'você não possui '..AxetemInfo.label..' para usar', 5)
    end
       
end)

RegisterServerEvent('woodstump:AddFirewood')
AddEventHandler("woodstump:AddFirewood", function()
   
        local WoodItemInfo = data.getItemData(Config.Wood)
        local WoodItemData = data.getItem(source, Config.Wood)
        WoodItemData.RemoveItem(1)
        TriggerClientEvent("redemrp_notification:start", source, "Adicionado "..WoodItemInfo.label, 3, "success")

        local FirewoodItemInfo = data.getItemData(Config.Firewood)
        local FirewoodItemData = data.getItem(source, Config.Firewood)
        FirewoodItemData.AddItem(2)
        TriggerClientEvent("redemrp_notification:start", source, "Adicionado "..FirewoodItemInfo.label, 3, "success")

       
	
end)



