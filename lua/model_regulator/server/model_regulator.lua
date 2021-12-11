local isBlacklistedModel = PlayerModelRegulator.Config.blacklistedModels
local defaultModel = PlayerModelRegulator.Config.defaultModel

local playerMeta = FindMetaTable( "Player" )
local entityMeta = FindMetaTable( "Entity" )
local setModel = entityMeta.SetModel

function playerMeta:SetModel( desiredModel )
    local model = ( isBlacklistedModel[desiredModel] and defaultModel ) or desiredModel

    return setModel( self, model )
end
