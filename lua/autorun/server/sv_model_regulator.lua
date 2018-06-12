local defaultModel = "models/player/kleiner.mdl"

local prohibitedModels = {}
prohibitedModels["models/player/skeleton.mdl"] = true
prohibitedModels["models/player/corpse1.mdl"]  = true
prohibitedModels["models/player/charple.mdl"]  = true

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")
local setModel = entityMeta.SetModel

function playerMeta:SetModel(desiredModel)
	local modelIsProhibited = prohibitedModels[desiredModel]
	
	if( modelIsProhibited ) then
		return setModel(self, defaultModel)
	end
	
	return setModel(self, desiredModel)
end
