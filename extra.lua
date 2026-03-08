local extraModule = {}

function extraModule.Setup(Window, Rayfield)
    local ExtraTab = Window:CreateTab("Extra", 4483362458)
    
    _G.TargetPlayer = ""
    _G.FollowEnabled = false
    _G.FollowDistance = 5
    
    local lp = game.Players.LocalPlayer

    local PlayerDropdown = ExtraTab:CreateDropdown({
       Name = "Target Player",
       Options = {"Searching..."},
       CurrentOption = {""},
       MultipleOptions = false,
       Flag = "TargetDropdown",
       Callback = function(Option)
           local selected = type(Option) == "table" and Option[1] or Option
           if selected and selected ~= "Searching..." then
               _G.TargetPlayer = selected
           end
       end,
    })

    local function updateList()
        local playerNames = {}
        for _, p in pairs(game.Players:GetPlayers()) do
            if p ~= lp then
                table.insert(playerNames, p.Name)
            end
        end
        
        if #playerNames == 0 then
            playerNames = {"No Players Found"}
        end
        
        PlayerDropdown:Refresh(playerNames, true)
    end

    game.Players.PlayerAdded:Connect(function()
        task.wait(1)
        updateList()
    end)

    game.Players.PlayerRemoving:Connect(function()
        task.wait(1)
        updateList()
    end)

    task.spawn(function()
        task.wait(2)
        updateList()
    end)

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
           if _G.TargetPlayer ~= "" and _G.TargetPlayer ~= "No Players Found" then
               _G.FollowEnabled = not _G.FollowEnabled
               Rayfield:Notify({
                   Title = "Follow System", 
                   Content = _G.FollowEnabled and "Following: " .. _G.TargetPlayer or "Follow Disabled", 
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
            else
                _G.FollowEnabled = false
            end
        end
    end)
end

return extraModule