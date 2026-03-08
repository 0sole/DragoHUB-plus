local debugModule = {}

function debugModule.Setup(Window, Rayfield)
    local DebugTab = Window:CreateTab("Debug", 4483362458)
    _G.LogDistance = false

    DebugTab:CreateToggle({
       Name = "Log Dash Distance",
       CurrentValue = false,
       Flag = "LogDistance",
       Callback = function(Value)
           _G.LogDistance = Value
       end,
    })
end

return debugModule