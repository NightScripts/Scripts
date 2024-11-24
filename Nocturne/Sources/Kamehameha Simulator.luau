local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
loadstring(game:HttpGet("https://raw.githubusercontent.com/NightScripts/Scripts/refs/heads/main/Nocturne/Rayfield%20Window.lua"))()

function Notify(t, c)
  Rayfield:Notify({
   Title = t,
   Content = c,
   Duration = 6.5,
   Image = 4483362458,
  })
end
  
local at = false
local ad = false
local v = 69
local s = 1

local Tab = Window:CreateTab("Main", "moon")

local Button = Tab:CreateButton({
   Name = "Claim Daily Reward",
   Callback = function()
      game:GetService("ReplicatedStorage").DailyEvents.ClaimDaily:FireServer()
   end,
})

local Button = Tab:CreateButton({
   Name = "Claim All Daily Reward",
   Callback = function()
      game:GetService("ReplicatedStorage").DailyEvents.ClaimAllDaily:FireServer()
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Train",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      at = Value
      Notify("Nocturne", "Equip the first tool.")
       game:GetService("RunService").RenderStepped:Connect(function()
          if at then
             local args = {
            [1] = 1
         }

          game:GetService("Players").LocalPlayer.Character.Punch.Event:FireServer(unpack(args))
          end
       end)
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Auto Claim Reward",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      ad = Value
       game:GetService("RunService").RenderStepped:Connect(function()
          if ad then
             game:GetService("ReplicatedStorage").DailyEvents.ClaimDaily:FireServer()
          end
       end)
   end,
})


Rayfield:LoadConfiguration()
