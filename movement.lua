local movementModule = {}

function movementModule.Setup(Window, Rayfield)
    local MainTab = Window:CreateTab("Movement", 4483362458)
    local lp = game.Players.LocalPlayer

    MainTab:CreateSection("Teleportation")

    MainTab:CreateKeybind({
       Name = "Teleport to Mouse",
       CurrentKeybind = "T",
       HoldToInteract = false,
       Callback = function()
           local mouse = lp:GetMouse()
           if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
               lp.Character.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
           end
       end,
    })
end

return movementModule