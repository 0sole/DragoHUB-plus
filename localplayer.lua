local lpModul = {}

function lpModul.HizAyarla(hizMiktari)
    local player = game.Players.LocalPlayer
    
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = hizMiktari
    end
    
    if not _G.SpeedConnection then
        _G.SpeedConnection = player.CharacterAdded:Connect(function(character)
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.WalkSpeed = _G.DesiredSpeed or 16
        end)
    end
    
    _G.DesiredSpeed = hizMiktari
end

return lpModul