local menu = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/menu.lua"))()
local lpLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/localplayer.lua"))()
local tsbLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/tsb.lua"))()
local debugLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/debug.lua"))()

local Window, Rayfield = menu.CreateGui()

lpLogic.Setup(Window, Rayfield)
tsbLogic.Setup(Window, Rayfield)
debugLogic.Setup(Window, Rayfield)

Rayfield:Notify({
    Title = "System Ready",
    Content = "All modules loaded successfully!",
    Duration = 5
})