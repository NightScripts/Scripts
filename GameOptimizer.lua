-- Basic Optimizer Script

local FL = {}

FL["L"] = game:GetService("Lighting")
FL["W"] = game:GetService("Workspace")
FL["T"] = FL["W"]:FindFirstChildOfClass("Terrain")
FL["NC"] = game:GetService("NetworkClient")

FL["S"] = {
    ["Brightness"] = 1,
    ["GlobalShadows"] = false,
    ["EnvironmentDiffuseScale"] = 0.5,
    ["EnvironmentSpecularScale"] = 0.5,
    ["OutdoorAmbient"] = Color3.new(0.5, 0.5, 0.5),
    ["ClockTime"] = 14,
    ["FogEnd"] = 100000,
}

FL["E"] = {
    "PostEffect",
    "Atmosphere",
    "BloomEffect",
    "ColorCorrectionEffect",
    "SunRaysEffect",
    "DepthOfFieldEffect",
    "BaseLight",
    "Sky",
}

FL["F1"] = function(e)
    for _, v in pairs(FL["E"]) do
        if e:IsA(v) then return true end
    end
    return false
end

FL["F2"] = function(e)
    if FL["F1"](e) then
        e:Destroy()
    end
end

FL["R"] = function()
    if FL["T"] and FL["T"]:FindFirstChildOfClass("Clouds") then
        FL["T"]:FindFirstChildOfClass("Clouds").Enabled = false
    end

    for _, e in pairs(FL["L"]:GetChildren()) do
        FL["F2"](e)
    end

    for _, d in pairs(FL["W"]:GetDescendants()) do
        FL["F2"](d)
    end
end

FL["C"] = {}

FL["NC"]:SetOutgoingKBPSLimit(math.huge)
setfpscap(120)

local function addConnections()
    FL["C"]["ChildAddedLighting"] = FL["L"].ChildAdded:Connect(function(child)
        FL["F2"](child)
    end)

    FL["C"]["ChildAddedWorkspace"] = FL["W"].ChildAdded:Connect(function(child)
        FL["F2"](child)
    end)

    FL["C"]["TerrainChanged"] = FL["T"].Changed:Connect(function()
        FL["R"]()
    end)
end

addConnections()

for k, v in pairs(FL["S"]) do
    FL["L"][k] = v
end

print("optm")
