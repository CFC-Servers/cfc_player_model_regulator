PlayerModelRegulator = PlayerModelRegulator or {}

AddCSLuaFile( "config.lua" )
include( "config.lua" )

AddCSLuaFile( "shared/model_regulator.lua" )
include( "shared/model_regulator.lua" )

if SERVER then
    include( "server/model_regulator.lua" )
end
