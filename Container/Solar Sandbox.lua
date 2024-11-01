--[ Deobfuscated using XzPDP (Xelioz Private Deobfuscator Program)
--[ Functions: 0
--[ Obfuscator: MoonSecV3
--[ Deobfuscated: 9:00 AM | November 1, 2024
--[ Prot: NaN%
--[ Original File Name: Inf_Money__OP__.txt | File Size: 210B | Source: scriptblox.com | Uploading Method: File Selection
local tag = "XZPDP"
print(tag)

local Library = loadstring(Game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/wizard"))()
local Window = Library:NewWindow("ExploitFin")

loadstring(game:HttpGet("https://gist.githubusercontent.com/ExploiterGuy/9ff1168f825faf779738132e1ae4b97e/raw/73893bf4558f6340eff7b1d8eafe9d5760e01938/Notification%2520UI%2520(Game%2520Name)"))()

local Main = Window:NewSection("Main")
local Gamepass = Window:NewSection("Gamepass")

Main:CreateButton("Unlimited Money", function()
local args = {
    [1] = -1000000000000000000,
    [2] = game:GetService("ReplicatedStorage").StoredParts.Spawn
}

game:GetService("ReplicatedStorage").Events.Buy:FireServer(unpack(args))
end)

Gamepass:CreateButton("Gun", function()
local args = {
    [1] = 0,
    [2] = game:GetService("ReplicatedStorage").StoredParts.M4A1
}

game:GetService("ReplicatedStorage").Events.Buy:FireServer(unpack(args))
end)

Gamepass:CreateButton("Amoeba", function()
local args = {
    [1] = 0,
    [2] = game:GetService("ReplicatedStorage").StoredParts:FindFirstChild("brain eating amoeba")
}

game:GetService("ReplicatedStorage").Events.Buy:FireServer(unpack(args))
end)
