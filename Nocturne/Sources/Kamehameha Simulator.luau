local Window = loadstring(game:HttpGet("https://raw.githubusercontent.com/NightScripts/Scripts/refs/heads/main/Nocturne/Rayfield%20Window.lua"))()

local function Notify(title, content)
    Window:Notify({
        Title = title,
        Content = content,
        Duration = 6.5,
        Image = 4483362458,
    })
end

local AutoFunctions = {
    AutoTrain = false,
    AutoClaim = false,
    Train = function()
        local args = { [1] = 1 } -- You might need to change this one
        game:GetService("Players").LocalPlayer.Character.Punch.Event:FireServer(unpack(args)) -- this too
    end,
    Claim = function()
        game:GetService("ReplicatedStorage").DailyEvents.ClaimDaily:FireServer()
    end,
}

game:GetService("RunService").RenderStepped:Connect(function()
    if AutoFunctions.AutoTrain then AutoFunctions.Train() end
    if AutoFunctions.AutoClaim then AutoFunctions.Claim() end
end)

local Tab = Window:CreateTab("Main", "moon")

Tab:CreateButton({
    Name = "Claim Daily Reward",
    Callback = function()
        AutoFunctions.Claim()
    end,
})

Tab:CreateButton({
    Name = "Claim All Daily Reward",
    Callback = function()
        game:GetService("ReplicatedStorage").DailyEvents.ClaimAllDaily:FireServer()
    end,
})

Tab:CreateToggle({
    Name = "Auto Train",
    CurrentValue = AutoFunctions.AutoTrain,
    Flag = "Toggle1",
    Callback = function(value)
        AutoFunctions.AutoTrain = value
        Notify("Nocturne", "Equip the first tool.")
    end,
})

Tab:CreateToggle({
    Name = "Auto Claim Reward",
    CurrentValue = AutoFunctions.AutoClaim,
    Flag = "Toggle2",
    Callback = function(value)
        AutoFunctions.AutoClaim = value
    end,
})

Window:LoadConfiguration()
