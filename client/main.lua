local QBCore = exports['qb-core']:GetCoreObject()

-- Toggle Edit Mode
RegisterCommand('edithud', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'openEdit'
    })
end, false)

-- Close Edit Mode
RegisterNUICallback('closeEdit', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)

-- Save Positions
RegisterNUICallback('savePositions', function(data, cb)
    -- Save to config or database
    cb('ok')
end)

-- Update player info
CreateThread(function()
    while true do
        Wait(1000)
        
        if LocalPlayer.state.isLoggedIn then
            local PlayerData = QBCore.Functions.GetPlayerData()
            
            SendNUIMessage({
                action = 'updatePlayerInfo',
                playerid = GetPlayerServerId(PlayerId()),
                bank = PlayerData.money['bank']
            })
        end
    end
end) 