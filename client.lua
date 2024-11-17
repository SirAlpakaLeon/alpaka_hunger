ESX = exports["es_extended"]:getSharedObject()

Citizen.CreateThread(function()
    while true do
        while not ESX.IsPlayerLoaded() do
            Wait(0)
        end
        Wait(10000)

        local playerPed = PlayerPedId()
        local hunger = 0

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            hunger = status.val
        end)

        if hunger < 100000 then
            TriggerEvent('playHungerSound', 1.0)
            SendNUIMessage({
                action = 'show',
                duration = 5000
            })
        end
    end
end)


RegisterNetEvent('playHungerSound')
AddEventHandler('playHungerSound', function(volume)
    local soundId = GetSoundId()
    PlaySoundFromEntity(soundId, "MP_RANK_UP", PlayerPedId(), "HUD_FRONTEND_DEFAULT_SOUNDSET", 0, volume)
    ReleaseSoundId(soundId)
end)
