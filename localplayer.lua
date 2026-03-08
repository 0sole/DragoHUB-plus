local lpModul = {}

function lpModul.Setup(Window, Rayfield)
    local MainTab = Window:CreateTab("LocalPlayer", 4483362458)
    
    _G.CFrameSpeed = 0
    _G.CFrameSpeedEnabled = false
    _G.FlySpeed = 1
    _G.FlyEnabled = false

    local lp = game.Players.LocalPlayer

    MainTab:CreateSection("CFrame Speed")
    
    MainTab:CreateSlider({
       Name = "Speed Multiplier",
       Range = {0, 10},
       Increment = 0.1,
       Suffix = "Factor",
       CurrentValue = 0,
       Callback = function(Value)
           _G.CFrameSpeed = Value
       end,
    })

    MainTab:CreateKeybind({
       Name = "Toggle Speed",
       CurrentKeybind = "Z",
       HoldToInteract = false,
       Callback = function()
           _G.CFrameSpeedEnabled = not _G.CFrameSpeedEnabled
           Rayfield:Notify({Title = "Speed", Content = _G.CFrameSpeedEnabled and "Enabled" or "Disabled", Duration = 2})
       end,
    })

    MainTab:CreateSection("Fly Mode")

    MainTab:CreateSlider({
       Name = "Fly Velocity",
       Range = {1, 10},
       Increment = 0.5,
       Suffix = "Speed",
       CurrentValue = 1,
       Callback = function(Value)
           _G.FlySpeed = Value
       end,
    })

    MainTab:CreateKeybind({
       Name = "Toggle Fly",
       CurrentKeybind = "X",
       HoldToInteract = false,
       Callback = function()
           _G.FlyEnabled = not _G.FlyEnabled
           Rayfield:Notify({Title = "Fly", Content = _G.FlyEnabled and "Enabled" or "Disabled", Duration = 2})
       end,
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
            local hrp = lp.Character.HumanoidRootPart
            local hum = lp.Character.Humanoid

            if _G.CFrameSpeedEnabled and hum.MoveDirection.Magnitude > 0 then
                hrp.CFrame = hrp.CFrame + (hum.MoveDirection * (_G.CFrameSpeed / 5))
            end

            if _G.FlyEnabled then
                hrp.Velocity = Vector3.new(0, 0.1, 0)
                if hum.MoveDirection.Magnitude > 0 then
                    hrp.CFrame = hrp.CFrame + (hum.MoveDirection * _G.FlySpeed)
                end
            end
        end
    end)
end

return lpModul