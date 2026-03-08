local menu = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/menu.lua"))()
local lpLogic = loadstring(game:HttpGet("https://raw.githubusercontent.com/0sole/DragoHUB-plus/refs/heads/main/localplayer.lua"))()

local Window, Rayfield = menu.CreateGui()
local MainTab = Window:CreateTab("Ana Sayfa", 4483362458)

MainTab:CreateButton({
   Name = "Hız Hilesi (32)",
   Callback = function()
       lpLogic.HizAyarla(32) 
       
       Rayfield:Notify({
          Title = "Başarılı!",
          Content = "Hızınız 32 olarak ayarlandı.",
          Duration = 3,
          Image = 4483362458,
       })
   end,
})

MainTab:CreateButton({
   Name = "Normal Hız (16)",
   Callback = function()
       lpLogic.HizAyarla(16)
   end,
})