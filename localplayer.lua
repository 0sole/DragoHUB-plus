local lpModul = {}

function lpModul.Setup(Window, Rayfield)
    local MainTab = Window:CreateTab("localplayer", 4483362458)

    local function HizAyarla(hizMiktari)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = hizMiktari
        end
        _G.DesiredSpeed = hizMiktari
    end

    MainTab:CreateButton({
       Name = "Hız Hilesi (32)",
       Callback = function()
           HizAyarla(32)
           Rayfield:Notify({
              Title = "Başarılı!",
              Content = "Hızınız 32 yapıldı.",
              Duration = 3,
              Image = 4483362458,
           })
       end,
    })

    MainTab:CreateButton({
       Name = "Normal Hız (16)",
       Callback = function()
           HizAyarla(16)
       end,
    })
end

return lpModul