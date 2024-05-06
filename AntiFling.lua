local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function disableCollision(player)
    if player == LocalPlayer then return end
    
    local character = player.Character
    if character then
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.CanCollide = false
                part.CustomPhysicalProperties = PhysicalProperties.new(0, 0, 0, 0, 0)
                part.Velocity = Vector3.new(0, 0, 0)
                part.RotVelocity = Vector3.new(0, 0, 0)
            end
        end
    end
end

RunService.Stepped:Connect(function()
    for _, otherPlayer in ipairs(Players:GetPlayers()) do
        disableCollision(otherPlayer)
    end
end)

print("Script has loaded")
