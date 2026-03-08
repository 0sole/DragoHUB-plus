local menu = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/menu.lua"))()
local Window, Rayfield = menu.CreateGui()

local MainTab = Window:CreateTab("Ana Sayfa", 4483362458)

MainTab:CreateButton({
   Name = "Hız Hilesi",
   Callback = function()
       print("Hız aktif edildi!")
   end,
})