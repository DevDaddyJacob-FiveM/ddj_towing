TowTruck = {
    ACTION = {
        NONE = 0,
        LOWERING = 1,
        RAISING = 2,
    },
    CONTROL_MODE = {
        BED = -1,
        WINCH = 0,
    },
    TYPE = {
        PROP_BASED = 0,
        SCOOP_BASED = 1,
    },
}
TowTruck.__index = TowTruck

function TowTruck.new(truckConfig, truckHandle)
    local truckType = TowTruck.ParseType(truckConfig.truckType)

    if TowTruck.TYPE.PROP_BASED == truckType then
        return PropTowTruck.new(truckConfig, truckHandle)
    end

    if TowTruck.TYPE.SCOOP_BASED == truckType then
        return ScoopTowTruck.new(truckConfig, truckHandle)
    end

    return nil
end

function TowTruck.ParseType(truckType)
    local _type = type(truckType)

    if ("string" == _type and "prop" == truckType:lower())
        or ("number" == _type and TowTruck.TYPE.PROP_BASED == truckType) then
        return TowTruck.TYPE.PROP_BASED
    end

    if ("string" == _type and "scoop" == truckType:lower())
        or ("number" == _type and TowTruck.TYPE.SCOOP_BASED == truckType) then
        return TowTruck.TYPE.SCOOP_BASED
    end

    return nil
end

