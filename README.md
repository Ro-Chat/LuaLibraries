Example of how to use Import
```lua
local Import = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ro-Chat/LuaLibraries/main/Import.lua"))()

-- This is for example, the values set here are already set by default.
Import.UrlPrefix = "https://raw.githubusercontent.com/"
Import.Git = "Ro-Chat/LuaLibraries/main"

local Struct = Import("Struct")
Import("Services")

print(Struct.pack(">bbbbb", 98, 97, 108, 108, 115))
print(ReplicatedStorage)
```
