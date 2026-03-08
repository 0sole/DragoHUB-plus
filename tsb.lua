local tsbModule = {}

function tsbModule.Setup(Window, Rayfield)
    local MainTab = Window:CreateTab("TSB", 4483362458)

    local dashSpeed = 150
    local qDelay = 0.05

    MainTab:CreateKeybind({
       Name = "Front Dash (Right)",
       CurrentKeybind = "V",
       HoldToInteract = false,
       Flag = "FrontDashKeybind", 
       Callback = function(Keybind)
           local player = game.Players.LocalPlayer
           local character = player.Character
           local hrp = character and character:FindFirstChild("HumanoidRootPart")

           if hrp then
               local startPos = hrp.Position
               hrp.Velocity = hrp.CFrame.RightVector * dashSpeed
               
               task.wait(qDelay)
               
               game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.Q, false, game)
               task.wait(0.01)
               game:GetService("VirtualInputManager"):SendKeyEvent(false, Enum.KeyCode.Q, false, game)

               task.delay(0.5, function()
                   if _G.LogDistance and hrp then
                       local distance = (hrp.Position - startPos).Magnitude
                       print("Dash Distance: " .. tostring(distance))
                   end
               end)
           end
       end,
    })
end

return tsbModule