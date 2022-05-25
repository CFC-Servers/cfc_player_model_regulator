local defaultModel = "models/player/kleiner.mdl"
local badModel = "models/player/skeleton.mdl"
local goodModel = "models/player/group01/male_07.mdl"

local playerMeta = FindMetaTable( "Player" )
local entityMeta = FindMetaTable( "Entity" )

return {
    groupName = "SetModel",

    beforeEach = function( state )
        state.finalModel = ""
    end,

    beforeAll = function( state )
        state._SetModel = entityMeta.SetModel
    end,

    afterAll = function( state )
        entityMeta.SetModel = state._SetModel
    end,

    cases = {
        {
            name = "It should replace undesireable playermodels with the default",
            func = function( state )
                playerMeta.SetModel( {}, badModel )

                expect( state.finalModel ).to.eq( defaultModel )
            end
        },
        {
            name = "It should leave good playermodels unchanged",
            func = function( state )
                playerMeta.SetModel( {}, goodModel )

                expect( state.finalModel ).to.eq( goodModel )
            end
        }
    }
}
