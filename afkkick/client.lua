local lastActiveTime = GetGameTimer()
local afkTimeLimit = 60000 -- 60 seconds

-- Detect any key press or movement to reset activity timer
CreateThread(function()
    while true do
        Wait(1000)
        if IsPedOnFoot(PlayerPedId()) or IsPedInAnyVehicle(PlayerPedId(), false) then
            if IsControlPressed(0, 32) or IsControlPressed(0, 33) or IsControlPressed(0, 34) or IsControlPressed(0, 35) or IsControlPressed(0, 24) then
                lastActiveTime = GetGameTimer()
            end
        end

        -- Notify server of inactivity
        local idleTime = GetGameTimer() - lastActiveTime
        TriggerServerEvent("afk:updateIdleTime", idleTime)
    end
end)
