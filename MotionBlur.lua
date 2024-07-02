getgenv().NightMotion = {
    Status = true,
    Multi = 10,
    Max = 20
}

local r = game:GetService("RunService")
local c = workspace.CurrentCamera
local p = game.Players.LocalPlayer

local b = Instance.new("BlurEffect")
b.Size = 0
b.Parent = c

local l = c.CFrame

local function a()
    local s, eM = pcall(function()
        if not getgenv().NightMotion.Status then
            b.Size = 0
            return
        end
        
        local cu = c.CFrame
        local d = (cu.Position - l.Position).Magnitude
        
        b.Size = math.clamp(d * getgenv().NightMotion.Multi, 0, getgenv().NightMotion.Max)
        
        l = cu
    end)
    
    if not s then
        warn("Error occurred:", eM)
        b.Size = 0
    end
end

r.RenderStepped:Connect(a)
