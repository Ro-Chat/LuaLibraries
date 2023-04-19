local mt = getrawmetatable(getfenv(1))
local old = mt.__index

setreadonly(mt, false)

mt.__index = function(self, property)
    if not old.checkcaller() then 
      return old[property]
    end
    
    local value = old[property]

    if not value then
        return old.game:GetService(property)
    end
    
    return value
end

setreadonly(mt, true)
