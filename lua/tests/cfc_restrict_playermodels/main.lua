local defaultModel = "models/player/kleiner.mdl"
local badModel = "models/player/skeleton.mdl"
local goodModel = "models/player/group01/male_07.mdl"

local playerMeta = FindMetaTable( "Player" )
local entityMeta = FindMetaTable( "Entity" )
local _SetModel
local finalModel

local pvpPlayer      = { IsInPvp = function() return true end }
local buildmodePlayer = { IsInPvp = function() return false end }

return {
    groupName = "SetModel",

    beforeAll = function()
        _SetModel = entityMeta.SetModel
        entityMeta.SetModel = function( _, mdl )
            finalModel = mdl
        end
        CFCPvp = true
    end,

    afterAll = function()
        entityMeta.SetModel = _SetModel
        CFCPvp = nil
    end,

    beforeEach = function()
        finalModel = ""
    end,

    cases = {
        {
            name = "PvP player: it should replace prohibited playermodels with the default",
            func = function()
                playerMeta.SetModel( pvpPlayer, badModel )

                expect( finalModel ).to.eq( defaultModel )
            end
        },
        {
            name = "PvP player: it should leave non-prohibited playermodels unchanged",
            func = function()
                playerMeta.SetModel( pvpPlayer, goodModel )

                expect( finalModel ).to.eq( goodModel )
            end
        },
        {
            name = "Buildmode player: it should leave prohibited playermodels unchanged",
            func = function()
                playerMeta.SetModel( buildmodePlayer, badModel )

                expect( finalModel ).to.eq( badModel )
            end
        },
        {
            name = "Buildmode player: it should leave non-prohibited playermodels unchanged",
            func = function()
                playerMeta.SetModel( buildmodePlayer, goodModel )

                expect( finalModel ).to.eq( goodModel )
            end
        },
    }
}
