local tsbModule = {}

function tsbModule.Setup(Window, Rayfield)
    local MainTab = Window:CreateTab("TSB", 4483362458)
    local vim = game:GetService("VirtualInputManager")

    local dashDistance = 215 
    local dashDuration = 0.2
    local qDelay = 0.1
    local sideDashAnimID = 10480370880

    MainTab:CreateKeybind({
       Name = "Front Dash",
       CurrentKeybind = "V",
       HoldToInteract = false,
       Flag = "FrontDashKeybind", 
       Callback = function(Keybind)
           local player = game.Players.LocalPlayer
           local character = player.Character
           local humanoid = character and character:FindFirstChild("Humanoid")
           local hrp = character and character:FindFirstChild("HumanoidRootPart")

           if hrp and humanoid then
               local startPos = hrp.Position
               
               local anim = Instance.new("Animation")
               anim.AnimationId = "rbxassetid://" .. sideDashAnimID
               local loadAnim = humanoid:LoadAnimation(anim)
               loadAnim:Play()

               local steps = 10
               local stepDistance = dashDistance / steps
               local waitTime = dashDuration / steps

               for i = 1, steps do
                   hrp.CFrame = hrp.CFrame * CFrame.new(stepDistance, 0, 0)
                   task.wait(waitTime)
               end

               task.delay(0.5, function()
                   if _G.LogDistance and hrp then
                       local distance = (hrp.Position - startPos).Magnitude
                       print("Dash Distance: " .. tostring(distance))
                   end
               end)

               task.wait(qDelay)
               
               vim:SendKeyEvent(true, Enum.KeyCode.Q, false, game)
               task.wait(0.01)
               vim:SendKeyEvent(false, Enum.KeyCode.Q, false, game)
           end
       end,
    })
end

return tsbModule