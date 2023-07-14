RedEM = exports["redem_roleplay"]:RedEM()

data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)


RegisterServerEvent('woodstump:CheckAxe')
AddEventHandler('woodstump:CheckAxe',function (scenario)
        local AxetemInfo = data.getItemData(Config.Axe)
        local AxeItemData = data.getItem(source, AxetemInfo.label)

        if AxeItemData.ItemAmount >=1 then
            local WoodItemInfo = data.getItemData(Config.Wood)
            local WoodItemData = data.getItem(source, WoodItemInfo.label)
        
            if WoodItemData.ItemAmount >=1 then
                TriggerClientEvent('woodstump:Chop',source,scenario)
            else              
                TriggerClientEvent("redem_roleplay:NotifyRight", source, 'você não possui '..WoodItemInfo.label..' para usar', 5)
            end
    else         
        TriggerClientEvent("redem_roleplay:NotifyRight", source, 'você não possui '..AxetemInfo.label..' para usar', 5)
    end
       
end)

RegisterServerEvent('woodstump:AddFirewood')
AddEventHandler("woodstump:AddFirewood", function()
   
        local WoodItemInfo = data.getItemData(Config.Wood)
        local WoodItemData = data.getItem(source, WoodItemInfo.label)
        WoodItemData.RemoveItem(1)
        TriggerClientEvent("redem_roleplay:NotifyRight", source, "Removido "..WoodItemInfo.label, 3, "success")      
        
        local FirewoodItemInfo = data.getItemData(Config.Firewood)
        local FirewoodItemData = data.getItem(source, FirewoodItemInfo.label)
        FirewoodItemData.AddItem(2)
        TriggerClientEvent("redem_roleplay:NotifyRight", source, "Adicionado "..FirewoodItemInfo.label, 3, "success")

       
	
end)



