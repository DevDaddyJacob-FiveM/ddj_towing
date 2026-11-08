logger = Logger.new("towing")

Config = {
    --[[
        When set to true, draws debug markers and text showing internal
        state for the tow truck the player is currently in/near.
    ]]
    DebugMode = false,

    --[[
        The maximum distance (in meters) the winch hook can reach when
        looking for a vehicle to attach to.
    ]]
    MaxHookReach = 10.0,

    --[[
        The prop model used for the winch hook.
    ]]
    HookModel = `prop_v_hook_s`,

    --[[
        Per-model configuration for every vehicle that should be usable as
        a tow truck. The key is the vehicle's model hash.
    ]]
    TowTrucks = {
        [`flatbed3`] = {
            truckType = "prop",
            truckModel = `flatbed3`,
            bedModel = `flatbed3_base`,
            bedExtraIndex = 1,
            lerpMult = 4.0,
            controlBoxOffset = vector3(-1.05, -1.0, 0.0),
            hookRootOffset = vector3(0.025, 4.5, 0.1),
            bedAttachOffset = vector3(0.0, 1.5, 0.3),
            bedOffsets = {
                raised = {
                    pos = vector3(0.0, -3.8, 0.45),
                    rot = vector3(0.0, 0.0, 0.0),
                },
                back = {
                    pos = vector3(0.0, -4.0, 0.0),
                    rot = vector3(0.0, 0.0, 0.0),
                },
                lowered = {
                    pos = vector3(0.0, -0.4, -1.0),
                    rot = vector3(12.0, 0.0, 0.0),
                },
            },
        },

        [`550towmfd2`] = {
            truckType = "scoop",
            truckModel = `550towmfd2`,
            controlBoxOffset = vector3(-1.1, -1.95, 0.1),
            hookRoot = {
                boneName = "attach_male",
                offset = vector3(0.0, 0.0, 0.0),
            },
            bedAttach = {
                boneName = "misc_z",
                offset = vector3(0.0, 0.0, 0.50),
            },
            bedPositions = {
                raised = 0.0,
                lowered = 0.25,
            },
        },
    },
}
