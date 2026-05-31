local defaultModel = "models/player/kleiner.mdl"

local modelIsProhibited = {}
modelIsProhibited["models/player/skeleton.mdl"] = true
modelIsProhibited["models/player/charple.mdl"]  = true
modelIsProhibited["models/player/zombie_soldier.mdl"]  = true

local playerMeta = FindMetaTable( "Player" )
local entityMeta = FindMetaTable( "Entity" )

function playerMeta:SetModel( desiredModel )
    local model
    if CFCPvp and playerMeta.IsInPvp( self ) then
        model = ( modelIsProhibited[desiredModel] and defaultModel ) or desiredModel
    else
        model = desiredModel
    end

    return entityMeta.SetModel( self, model )
end

hook.Add( "CFC_PvP_PlayerEnterPvp", "CFC_PvP_PlayerEnterPvp_ModelRegulator", function( ply )
    local currModel = ply:GetModel()
    if not modelIsProhibited[currModel] then return end

    ply:SetModel( currModel )
end )
