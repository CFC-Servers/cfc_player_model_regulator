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

        entityMeta.SetModel = function( self, mdl )
            finalModel = mdl
        end
    end,

    afterAll = function()
        entityMeta.SetModel = _SetModel
    end,

    beforeEach = function( state )
        finalModel = ""
    end,

    cases = {
        {
            name = "It should replace undesireable playermodels with the default",
            func = function( state )
                playerMeta.SetModel( {}, badModel )

                expect( finalModel ).to.eq( defaultModel )
            end
        },
        {
            name = "It should leave good playermodels unchanged",
            func = function( state )
                playerMeta.SetModel( {}, goodModel )

                expect( finalModel ).to.eq( goodModel )
            end
        }
    }
}
