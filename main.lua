local menu = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/menu.lua"))()
local lpLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/localplayer.lua"))()
local tsbLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/tsb.lua"))()

local Window, Rayfield = menu.CreateGui()

lpLogic.Setup(Window, Rayfield)
tsbLogic.Setup(Window, Rayfield)

-- Eğer TSB modülün de varsa onu da böyle eklersin:
-- tsbLogic.Setup(Window, Rayfield)

Rayfield:Notify({
    Title = "Sistem Hazır",
    Content = "Tüm modüller başarıyla yüklendi!",
    Duration = 5
})