Example of how to use Import.lua ```lua
local Import = loadstring(game:HttpGet("https://raw.githubusercontent.com/Ro-Chat/LuaLibraries/main/Import.lua"))()
local Struct = Import("Struct")
Import("Services")

print(Struct.pack(">bbbbb", 98, 97, 108, 108, 115))
print(ReplicatedStorage)
```
