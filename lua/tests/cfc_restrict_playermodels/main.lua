local defaultModel = "models/player/kleiner.mdl"
local badModel = "models/player/skeleton.mdl"
local goodModel = "models/player/group01/male_07.mdl"

local playerMeta = FindMetaTable( "Player" )
local entityMeta = FindMetaTable( "Entity" )
local _SetModel
local _IsInPvp
local finalModel

return {
    groupName = "SetModel",

    beforeAll = function()
        _SetModel = entityMeta.SetModel
        _IsInPvp = playerMeta.IsInPvp
        entityMeta.SetModel = function( _, mdl )
            finalModel = mdl
        end
    end,

    afterAll = function()
        entityMeta.SetModel = _SetModel
        playerMeta.IsInPvp = _IsInPvp
        CFCPvp = nil
    end,

    beforeEach = function()
        finalModel = ""
    end,

    cases = {
        {
            name = "PvP player: it should replace prohibited playermodels with the default",
            func = function()
                CFCPvp = true
                playerMeta.IsInPvp = function() return true end

                playerMeta.SetModel( {}, badModel )

                expect( finalModel ).to.eq( defaultModel )
            end
        },
        {
            name = "PvP player: it should leave non-prohibited playermodels unchanged",
            func = function()
                CFCPvp = true
                playerMeta.IsInPvp = function() return true end

                playerMeta.SetModel( {}, goodModel )

                expect( finalModel ).to.eq( goodModel )
            end
        },
        {
            name = "Buildmode player: it should leave prohibited playermodels unchanged",
            func = function()
                CFCPvp = true
                playerMeta.IsInPvp = function() return false end

                playerMeta.SetModel( {}, badModel )

                expect( finalModel ).to.eq( badModel )
            end
        },
        {
            name = "Buildmode player: it should leave non-prohibited playermodels unchanged",
            func = function()
                CFCPvp = true
                playerMeta.IsInPvp = function() return false end

                playerMeta.SetModel( {}, goodModel )

                expect( finalModel ).to.eq( goodModel )
            end
        },
    }
}
