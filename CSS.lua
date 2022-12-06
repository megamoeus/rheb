-- New --

local OldIndex = nil

OldIndex = hookmetamethod(game, "__index", function(a, k)
    if not checkcaller() and tostring(a) == "multiJumpCount" 
    and k == "Value" then
        return 50;
    end

    return OldIndex(a, k)
end)

-- Old --

local mt = getrawmetatable(game)
local __oldIndex = mt.__index
local __oldNewIndex = mt.__newindex

if setreadonly then setreadonly(mt, false) else make_writeable(mt) end

mt.__index = newcclosure(function(a, k)
    if not checkcaller() then
        if tostring(a) == "VipOwner" then
            if k == "Value" then
                return 1;
            end
        end
    end
    return __oldIndex(a, k)
end)
