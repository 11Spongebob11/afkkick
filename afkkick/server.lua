local idleTimes = {}

RegisterServerEvent("afk:updateIdleTime")
AddEventHandler("afk:updateIdleTime", function(idleTime)
    local src = source
    idleTimes[src] = idleTime

    if idleTime > 600000 then -- 10 Minutes
        DropPlayer(src, "You were kicked for being AFK too long.")
    end
end)

-- Cleanup on player leave
AddEventHandler("playerDropped", function()
    idleTimes[source] = nil
end)
