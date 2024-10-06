--// Jule's RNG
--// https://www.roblox.com/games/16883974868/10-000x-Luck-Jules-RNG

local Nocturne = {}

function Nocturne:Services()
    return {
        ReplicatedStorage = game:GetService("ReplicatedStorage"),
        RunService = game:GetService("RunService"),
        Players = game:GetService("Players")
    }
end

Nocturne.Services = Nocturne:Services()
local NocturneAuraFolder = Nocturne.Services.ReplicatedStorage:FindFirstChild("Auras")
local NocturneRemoteAcceptAura = Nocturne.Services.ReplicatedStorage.Remotes.AcceptAura
local NocturneRemoteRoll = Nocturne.Services.ReplicatedStorage.Remotes.Roll

local NocturneROLL_INTERVAL = 0.1
local NocturneROLL_COUNT = 100

Nocturne.ARM = {
    AuraFolder = NocturneAuraFolder,
    RemoteAcceptAura = NocturneRemoteAcceptAura,
}

function Nocturne.ARM:AcceptAllAuras()
    if self.AuraFolder then
        for _, NocturneAura in ipairs(self.AuraFolder:GetChildren()) do
            self.RemoteAcceptAura:FireServer(NocturneAura.Name, true)
        end
    end
end

Nocturne.RollingManager = {
    RemoteRoll = NocturneRemoteRoll,
}

function Nocturne.RollingManager:RollMultipleTimes(count)
    for _ = 1, count do
        self.RemoteRoll:InvokeServer()
    end
end

Nocturne.MMG = {
    RollInterval = NocturneROLL_INTERVAL,
    RollCount = NocturneROLL_COUNT,
}

function Nocturne.MMG:ExecuteRollAndAccept()
    Nocturne.RollingManager:RollMultipleTimes(self.RollCount)
    Nocturne.ARM:AcceptAllAuras()
end

local function OnRenderStep()
    Nocturne.MMG:ExecuteRollAndAccept()
end

Nocturne.Services.RunService.RenderStepped:Connect(OnRenderStep)
