-- Hold

local defaultModel = "models/player/kleiner.mdl"
local prohibitedModels = {}
prohibitedModels["models/player/skeleton.mdl"] = true
prohibitedModels["models/player/corpse1.mdl"] = true

local function regulateModel( player )
  local modelIsProhibited = prohibitedModels[player:GetModel()]
  
  if( modelIsProhibited ) then
    player:ChatPrint( "Your selected model is prohibited, defaulting to "..defaultModel )
    player:SetModel( defaultModel )
  end
end

hook.Remove("PlayerSetModel", "cfc_player_model_regulator")
hook.Add("PlayerSetModel", "cfc_player_model_regulator", regulateModel)
