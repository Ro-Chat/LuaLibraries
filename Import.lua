if not isfolder("Libraries") then
    makefolder("Libraries")
end

getgenv().LoadedLibraries = {}

return setmetatable({
    UrlPrefix = "https://raw.githubusercontent.com/",
    Git = "Ro-Chat/LuaLibraries/main"
  }, {
    __call = function(self: table, Path: string)
        local LibPath: string = ("Libraries/%s.lib"):format(Path) -- Using .lib so I don't replace any lua files.
        if LoadedLibraries[LibPath] then
            return LoadedLibraries[LibPath]
        end
        
        if not isfile(LibPath) then
           local Script: string = game:HttpGet(("%s%s/%s.lua"):format(self.UrlPrefix, self.Git or "", Path))
           writefile(LibPath, Script)
            
           local status, errorMessage = pcall(loadstring(Script))
           
           if not status then
             error(errorMessage)
           end
           
           LoadedLibraries[LibPath] = errorMessage or {}
           return LoadedLibraries[LibPath]
        end
        local status, errorMessage = pcall(loadstring(readfile(LibPath)))
            
        if not status then
           error(errorMessage)
        end
        
        LoadedLibraries[LibPath] = errorMessage or {}
        return LoadedLibraries[LibPath]
    end
  }
)
