local tsbModule = {}

function tsbModule.Setup(Window, Rayfield)
    local MainTab = Window:CreateTab("TSB", 4483362458)
    local vim = game:GetService("VirtualInputManager")

    local qDelay = 0.5 

    MainTab:CreateKeybind({
       Name = "Front Dash",
       CurrentKeybind = "V",
       HoldToInteract = false,
       Flag = "FrontDashKeybind", 
       Callback = function(Keybind)
           local player = game.Players.LocalPlayer
           local character = player.Character
           local hrp = character and character:FindFirstChild("HumanoidRootPart")

           if hrp then
               local startPos = hrp.Position
               
               vim:SendKeyEvent(true, Enum.KeyCode.D, false, game)
               task.wait(0.02)
               vim:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
               task.wait(0.02)
               vim:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
               task.wait(0.02)
               vim:SendKeyEvent(false, Enum.KeyCode.D, false, game)

               task.delay(0.5, function()
                   if _G.LogDistance and hrp then
                       local sideDistance = (hrp.Position - startPos).Magnitude
                       print("Side Dash Distance: " .. tostring(sideDistance))
                   end
               end)

               task.wait(qDelay)
               
               vim:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
               task.wait(0.02)
               vim:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
           end
       end,
    })
end

return tsbModule