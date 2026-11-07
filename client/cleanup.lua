--[[
    The idea here is that the bed objects could linger, so this aims to allow
    other clients to cleanup these leftover objects as they come across them
]]

local function isOrphanedBed(bedHandle)
    local ownerNetId = Entity(bedHandle).state["DevJacob:Towing:OwnerTruck"]

    if nil == ownerNetId then
        return false
    end

    if not NetworkDoesNetworkIdExist(ownerNetId) then
        return true
    end

    local truckHandle = NetworkGetEntityFromNetworkId(ownerNetId)

    return not DoesEntityExist(truckHandle)
end


local function deleteOrphanedBed(bedHandle)
    local playerId = PlayerId()

    if playerId ~= NetworkGetEntityOwner(bedHandle) then
        local attempts = 1
        while attempts <= 10 and playerId ~= NetworkGetEntityOwner(bedHandle) do
            attempts = attempts + 1
            NetworkRequestControlOfEntity(bedHandle)

            Citizen.Wait(100)
        end
    end

    if DoesEntityExist(bedHandle) then
        logger:debug("Deleting orphaned tow truck bed object %s", bedHandle)
        DeleteEntity(bedHandle)
    end
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        local objects = GetGamePool("CObject")
        for i = 1, #objects do
            local object = objects[i]

            if DoesEntityExist(object) and isOrphanedBed(object) then
                deleteOrphanedBed(object)
            end
        end
    end
end)
