local defaultModel = "models/player/kleiner.mdl"
local badModel = "models/player/skeleton.mdl"
local goodModel = "models/player/group01/male_07.mdl"

local playerMeta = FindMetaTable( "Player" )
local entityMeta = FindMetaTable( "Entity" )
local _SetModel
local finalModel

return {
    groupName = "SetModel",

    beforeAll = function()
        _SetModel = entityMeta.SetModel

        entityMeta.SetModel = function( _, mdl )
            finalModel = mdl
        end
    end,

    afterAll = function()
        entityMeta.SetModel = _SetModel
    end,

    beforeEach = function()
        finalModel = ""
    end,

    cases = {
        {
            name = "It should replace undesireable playermodels with the default",
            func = function()
                playerMeta.SetModel( {}, badModel )

                expect( finalModel ).to.eq( defaultModel )
            end
        },
        {
            name = "It should leave good playermodels unchanged",
            func = function()
                playerMeta.SetModel( {}, goodModel )

                expect( finalModel ).to.eq( goodModel )
            end
        }
    }
}
