local isBlacklistedModel = PlayerModelRegulator.Config.blacklistedModels

local originalList = player_manager.AllValidModels()
local modelList = {}

for name, model in pairs( originalList ) do
    if not isBlacklistedModel[model] then
        modelList[name] = model
    end
end

player_manager._AllValidModels = player_manager.AllValidModels

function player_manager.AllValidModels()
    return modelList
end
