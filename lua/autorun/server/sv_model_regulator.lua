local defaultModel = "models/player/kleiner.mdl"

local modelIsProhibited = {}
modelIsProhibited["models/player/skeleton.mdl"] = true
modelIsProhibited["models/player/corpse1.mdl"]  = true
modelIsProhibited["models/player/charple.mdl"]  = true

local playerMeta = FindMetaTable("Player")
local entityMeta = FindMetaTable("Entity")
local setModel = entityMeta.SetModel

function playerMeta:SetModel(desiredModel)
	local modelIsProhibited = modelIsProhibited[desiredModel]
	
	if( modelIsProhibited ) then
		return setModel(self, defaultModel)
	end
	
	return setModel(self, desiredModel)
end
