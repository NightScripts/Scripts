-- why obfuscate? deobfuscated
-- removed every gui instances cuz why not, shit is likely ai
-- also i made it shorter just like you, jk
-- im too bored to use my style rn
-- original shit: https://scriptblox.com/script/Tower-But-The-Floor-Is-LAVA-Gui-20389
-- orbs - creator

local t = false -- set to true

local function getmoney() -- Gives money
    local args = {
    [1] = 999999999
    }

    game:GetService("ReplicatedStorage").Remotes2.SpinEnded:FireServer(unpack(args))
end

while t do  -- apparently his money giver (irreversible omggg) but for fuck sake i made it sum else it has tegle omggmgmgmg tegle
    getmoney()
    task.wait()
end

local function tpshit() -- yeah tepeport omg
    local pos = Vector3.new(-108, 1693.7615966796875, -298)
    local plr = game.Players.LocalPlayer
    local chr = plr.Character or plr.CharacterAdded:Wait()
    local rootofpenis 
    rootofpenis = chr:FindFirstChild("HumanoidRootPart") -- why did i do this
    
    if chr and rootofpenis then
        chr.HumanoidRootPart.CFrame = CFrame.new(pos)
    end
end
