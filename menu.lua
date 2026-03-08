local menu = {}

function menu.CreateGui()
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    local Window = Rayfield:CreateWindow({
       Name = "Rayfield Example Window",
       Icon = 0,
       LoadingTitle = "Rayfield Interface Suite",
       LoadingSubtitle = "by Sirius",
       Theme = "Default",
       ToggleUIKeybind = "L",
       ConfigurationSaving = {
          Enabled = true,
          FileName = "Big Hub"
       },
       KeySystem = false
    })
    
    return Window, Rayfield -- Hem pencereyi hem kütüphaneyi döndürüyoruz
end

return menu