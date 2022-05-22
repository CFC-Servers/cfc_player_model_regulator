local defaultModel = "models/player/kleiner.mdl"
local badModel = "models/player/skeleton.mdl"
local goodModel = "models/player/group01/male_07.mdl"

local function testSetModel( requestedModel )
    local finalModel = ""

    local playerMeta = FindMetaTable( "Player" )
    local entityMeta = FindMetaTable( "Entity" )

    local ogSetModel = entityMeta.SetModel

    entityMeta.SetModel = function( self, mdl )
        finalModel = mdl
    end

    playerMeta.SetModel( {}, requestedModel ) -- Apply subject function
    entityMeta.SetModel = ogSetModel -- Revert

    return finalModel
end

return {
    {
        name = "It should replace undesireable playermodels with the default.",
        func = function()
            finalModel = testSetModel( badModel )

            print( "testModel: ", badModel, "expectedModel: ", defaultModel, "finalModel: ", finalModel )
            print( table.ToString( expect( finalModel ) ) )

            expect( finalModel ).to.eq( defaultModel )
        end
    },
    {
        name = "It should leave good playermodels unchanged.",
        func = function()
            finalModel = testSetModel( goodModel )

            print( "testModel: ", goodModel, "expectedModel: ", goodModel, "finalModel: ", finalModel )
            print( table.ToString( expect( finalModel ) ) )

            expect( finalModel ).to.eq( goodModel )
        end
    },
}
