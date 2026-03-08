local menu = {}

function menu.CreateGui()
   local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
   local Window = Rayfield:CreateWindow({
      Name = "DragoHUB Plus",
      Icon = 0,
      LoadingTitle = "DragoHUB Suite",
      LoadingSubtitle = "by Sirius",
      Theme = "Default",
      ToggleUIKeybind = "L",
      ConfigurationSaving = {
         Enabled = true,
         FileName = "DragoConfig"
      },
      KeySystem = false
   })
    
   return Window, Rayfield
end

return menu