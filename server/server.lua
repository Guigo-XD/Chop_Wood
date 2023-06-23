data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterServerEvent('woodstump:CheckAxe')
AddEventHandler('woodstump:CheckAxe',function (scenario)
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
   
        local AxetemInfo = data.getItemData(Config.Axe)
        local AxeItemData = data.getItem(source, Config.Axe)
        local TotalAxeitem = (AxeItemData.ItemAmount)

        if TotalAxeitem > 1 then
            local WoodItemInfo = data.getItemData(Config.Wood)
            local WoodItemData = data.getItem(source, Config.Wood)
            local TotalWoodItem = (WoodItemData.ItemAmount)
        
            if TotalWoodItem > 1 then
                TriggerClientEvent('woodstump:Chop',scenario)
            else
                TriggerClientEvent("redemrp_notification:start", source, 'você não possui '..WoodItemInfo.label..' para usar', 5)
            end
    else
      
        TriggerClientEvent("redemrp_notification:start", source, 'você não possui '..AxetemInfo.label..' para usar', 5)
    end
       
	end)
    
end)

RegisterServerEvent('woodstump:AddFirewood')
AddEventHandler("woodstump:AddFirewood", function()
    TriggerEvent("redemrp:getPlayerFromId", source, function(user)
   
        local WoodItemInfo = data.getItemData(Config.Wood)
        local WoodItemData = data.getItem(source, Config.Wood)
        WoodItemData.RemoveItem(1)
        TriggerClientEvent("redemrp_notification:start", source, "Adicionado "..WoodItemInfo.label, 3, "success")

        local FirewoodItemInfo = data.getItemData(Config.Firewood)
        local FirewoodItemData = data.getItem(source, Config.Firewood)
        FirewoodItemData.AddItem(2)
        TriggerClientEvent("redemrp_notification:start", source, "Adicionado "..FirewoodItemInfo.label, 3, "success")

       
	end)
end)



