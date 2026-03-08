local menu = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/menu.lua"))()
local lpLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/localplayer.lua"))()
local tsbLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/tsb.lua"))()
local debugLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/debug.lua"))()

local Window, Rayfield = menu.CreateGui()

lpLogic.Setup(Window, Rayfield)
tsbLogic.Setup(Window, Rayfield)
debugLogic.Setup(Window, Rayfield)

local SettingsTab = Window:CreateTab("Settings", 4483362458)

SettingsTab:CreateButton({
   Name = "Unload Script",
   Callback = function()
       local player = game.Players.LocalPlayer
       if player.Character and player.Character:FindFirstChild("Humanoid") then
           player.Character.Humanoid.WalkSpeed = 16
       end
       _G.LogDistance = nil
       _G.DesiredSpeed = nil
       Rayfield:Destroy()
   end,
})

Rayfield:Notify({
    Title = "System Ready",
    Content = "All modules loaded successfully!",
    Duration = 5
})