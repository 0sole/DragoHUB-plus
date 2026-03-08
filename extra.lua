local extraModule = {}

function extraModule.Setup(Window, Rayfield)
    local ExtraTab = Window:CreateTab("Extra", 4483362458)
    
    _G.TargetPlayer = ""
    _G.FollowEnabled = false
    _G.FollowDistance = 5
    
    local lp = game.Players.LocalPlayer

    local PlayerDropdown = ExtraTab:CreateDropdown({
       Name = "Target Player",
       Options = {},
       CurrentOption = "",
       MultipleOptions = false,
       Flag = "TargetDropdown",
       Callback = function(Option)
           _G.TargetPlayer = typeof(Option) == "table" and Option[1] or Option
       end,
    })

    local function updatePlayerList()
        local playerList = {}
        for _, v in pairs(game.Players:GetPlayers()) do
            if v ~= lp then
                table.insert(playerList, v.Name)
            end
        end
        PlayerDropdown:Refresh(playerList, true)
    end

    game.Players.PlayerAdded:Connect(updatePlayerList)
    game.Players.PlayerRemoving:Connect(updatePlayerList)
    updatePlayerList()

    ExtraTab:CreateSlider({
       Name = "Follow Distance",
       Range = {1, 10},
       Increment = 1,
       Suffix = "Studs",
       CurrentValue = 5,
       Callback = function(Value)
           _G.FollowDistance = Value
       end,
    })

    ExtraTab:CreateKeybind({
       Name = "Toggle Follow",
       CurrentKeybind = "V",
       HoldToInteract = false,
       Callback = function()
           if _G.TargetPlayer ~= "" then
               _G.FollowEnabled = not _G.FollowEnabled
               Rayfield:Notify({
                   Title = "Follow", 
                   Content = _G.FollowEnabled and "Active" or "Disabled", 
                   Duration = 2
               })
           end
       end,
    })

    game:GetService("RunService").Heartbeat:Connect(function()
        if _G.FollowEnabled and _G.TargetPlayer ~= "" then
            local target = game.Players:FindFirstChild(_G.TargetPlayer)
            if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
                local myHRP = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
                if myHRP then
                    myHRP.CFrame = target.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, _G.FollowDistance)
                end
            end
        end
    end)
end

return extraModule