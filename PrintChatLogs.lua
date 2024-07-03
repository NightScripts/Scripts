local status = true

local function output(plr, msg)
    if not status then return end
    
    local playerName = plr.Name
    print(playerName .. ": " .. msg)
end

for _, player in ipairs(game.Players:GetPlayers()) do
    player.Chatted:Connect(function(msg)
        output(player, msg)
    end)
end

game.Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(msg)
        output(player, msg)
    end)
end)
