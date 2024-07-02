getgenv().nightTable = {
    enabled = false,
    transparencyIncrement = 0.5
}

local function enableXray()
    local config = getgenv().nightTable
    config.enabled = not config.enabled
    
    if config.enabled then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsA("Terrain") then
                v.Transparency = math.min(v.Transparency + config.transparencyIncrement, 1)
            end
        end
    else
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsA("Terrain") then
                v.Transparency = 0
            end
        end
    end
end

enableXray()
