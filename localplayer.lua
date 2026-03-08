game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		-- Humanoid objesini buluyoruz
		local humanoid = character:WaitForChild("Humanoid")
		
		-- Standart hız 16'dır. Burayı istediğin sayıyla değiştirebilirsin.
		humanoid.WalkSpeed = 32 
	end)
end)