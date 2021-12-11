local isBlacklistedModel = PlayerModelRegulator.Config.blacklistedModels

local originalList = player_manager.AllValidModels()
local modelList = {}

for name, model in pairs( originalList ) do
    if not isBlacklistedModel[model] then
        modelList[name] = model
    end
end

player_manager._AllValidModels = player_manager.AllValidModels
player_manager._TranslatePlayerModel = player_manager.TranslatePlayerModel
player_manager._TranslateToPlayerModelName = player_manager.TranslateToPlayerModelName

function player_manager.AllValidModels()
    return modelList
end
