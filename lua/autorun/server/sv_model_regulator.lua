local defaultModel = "models/player/kleiner.mdl"

local modelIsProhibited = {}
modelIsProhibited["models/player/skeleton.mdl"] = true
modelIsProhibited["models/player/charple.mdl"]  = true
modelIsProhibited["models/player/zombie_soldier.mdl"]  = true

local playerMeta = FindMetaTable( "Player" )
local entityMeta = FindMetaTable( "Entity" )

function playerMeta:SetModel( desiredModel )
    local model = ( modelIsProhibited[desiredModel] and defaultModel ) or desiredModel

    return entityMeta.SetModel( self, model )
end
