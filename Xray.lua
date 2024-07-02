getgenv().nightTable = {
    enabled = false,
    transparency = 0.5
}

local function enableXray()
    local config = getgenv().nightTable
    config.enabled = not config.enabled
    
    if config.enabled then
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and not v:IsA("Terrain") then
                v.Transparency = config.transparency
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

-- I am stupid for adding that math shit when it wasn't that necessary mb 
