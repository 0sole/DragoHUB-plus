local UI_Module = loadstring(game:HttpGet("MODUL_LINKINIZ"))()
local Window, Rayfield = UI_Module.CreateGui()

local MainTab = Window:CreateTab("Ana Sayfa", 4483362458)

MainTab:CreateButton({
   Name = "Hız Hilesi",
   Callback = function()
       print("Hız aktif edildi!")
   end,
})