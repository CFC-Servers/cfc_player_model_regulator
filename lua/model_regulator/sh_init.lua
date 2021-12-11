PlayerModelRegulator = PlayerModelRegulator or {}

AddCSLuaFile( "config.lua" )
include( "config.lua" )

if SERVER then
    include( "server/model_regulator.lua" )
end
