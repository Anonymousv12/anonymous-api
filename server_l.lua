ESX = exports["es_extended"]:getSharedObject()



exports('getadm', function()
    local players = {}
    
    for i, playerId in ipairs(GetPlayers()) do
        local  xPlayer = ESX.GetPlayerFromId(playerId)

        if xPlayer.getGroup() == "owner" or xPlayer.getGroup() == "managment" or xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "moderator" or xPlayer.getGroup() == "support" or xPlayer.getGroup() == "tsupport" then

            local pl = {playerId}
            table.insert(players, i, pl)

        end
    
    end

    return(players)

end)


