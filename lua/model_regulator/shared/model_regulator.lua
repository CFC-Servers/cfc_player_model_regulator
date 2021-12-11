local isBlacklistedModel = PlayerModelRegulator.Config.blacklistedModels

local originalList = player_manager.AllValidModels()
local modelList = {}
local modelListRev = {}

for name, model in pairs( originalList ) do
    if not isBlacklistedModel[model] then
        modelList[name] = model
        modelListRev[model] = name
    end
end

player_manager._AllValidModels = player_manager.AllValidModels
player_manager._TranslatePlayerModel = player_manager.TranslatePlayerModel
player_manager._TranslateToPlayerModelName = player_manager.TranslateToPlayerModelName

function player_manager.AllValidModels()
    return modelList or "models/player/kleiner.mdl"
end

function player_manager.TranslatePlayerModel( name )
    return modelList[name] or defaultModel
end

function player_manager.TranslateToPlayerModelName( model )
    model = string.lower( model )

    return modelListRev[model] or "kleiner"
end
