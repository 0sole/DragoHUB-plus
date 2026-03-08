local lpModul = {}

function lpModul.Setup(Window, Rayfield)
    local MainTab = Window:CreateTab("LocalPlayer", 4483362458)

    local function SetSpeed(speedValue)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = speedValue
        end
        _G.DesiredSpeed = speedValue
    end

    MainTab:CreateButton({
       Name = "Speed Hack (32)",
       Callback = function()
           SetSpeed(32)
       end,
    })

    MainTab:CreateButton({
       Name = "Normal Speed (16)",
       Callback = function()
           SetSpeed(16)
       end,
    })
end

return lpModul