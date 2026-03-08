local tsbModule = {}

function tsbModule.Setup(Window, Rayfield)
    local MainTab = Window:CreateTab("TSB", 4483362458)

    local dashSpeed = 150
    local qDelay = 0.05
    local qHoldTime = 0.05

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
               hrp.Velocity = hrp.CFrame.RightVector * dashSpeed
               
               task.wait(qDelay)
               
               if keypress and keyrelease then
                   keypress(0x51)
                   task.wait(qHoldTime)
                   keyrelease(0x51)
               end
           end
       end,
    })
end

return tsbModule