local menu = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/menu.lua"))()
local lpLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/localplayer.lua"))()
local movementLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/movement.lua"))()

local Window, Rayfield = menu.CreateGui()

lpLogic.Setup(Window, Rayfield)
movementLogic.Setup(Window, Rayfield)

local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateButton({
   Name = "Unload Script",
   Callback = function()
       _G.CFrameSpeedEnabled = false
       _G.FlyEnabled = false
       Rayfield:Destroy()
   end,
})

Rayfield:Notify({
    Title = "System Ready",
    Content = "All English modules loaded!",
    Duration = 5
})