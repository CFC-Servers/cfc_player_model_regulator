local defaultModel = "models/player/kleiner.mdl"

local modelIsProhibited = {}
modelIsProhibited["models/player/skeleton.mdl"] = true
modelIsProhibited["models/player/charple.mdl"]  = true
modelIsProhibited["models/player/zombie_soldier.mdl"]  = true

local playerMeta = FindMetaTable( "Player" )
local entityMeta = FindMetaTable( "Entity" )
local setModel = entityMeta.SetModel

function playerMeta:SetModel( desiredModel )
    local model = ( modelIsProhibited[desiredModel] and defaultModel ) or desiredModel

    return setModel( self, model )
end
