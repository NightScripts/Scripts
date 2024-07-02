--[ Config Shit ]--
local NightTable = {
    enabled = true, -- De toggle
    am = {
        enabled = true,
        Message = "SKADOOSH", -- Be free to change
    },
}

--[ Services ]--
local replS = game:GetService("ReplicatedStorage")
local playS = game:GetService("Players")
local httpS = game:GetService("HttpService")
local markS = game:GetService("MarketplaceService")

--[ Events ]--
local defChatSys = replS:FindFirstChild('DefaultChatSystemChatEvents')
if not defChatSys or not defChatSys:FindFirstChild('OnMessageDoneFiltering') then return end

local messages = {
  ["fat"] = "Bullying",
  ["you fat"] = "Bullying",
  ["you suck"] = "Bullying",
  ["trash"] = "Bullying",
  -- [ Add Messages Here. ]
  -- [ Syntax: ["Key"] = "Value", ]
  -- [ Value List: Bullying, Dating, Swearing, Scamming, Offsite Links, Swearing, Inappropriate Content, Personal Information]
}

local function processMessages(m, r)
  if not NightTable.enabled then
    return
  end
  
  for msg, rsn in pairs(messages) do
    if string.match(string.lower(m), msg) then
      playS:ReportAbuse(playS[r], rsn, "Breaking Roblox Terms of Service")
      wait(1)
      playS:ReportAbuse(playS[r], rsn, "Breaking Roblox Terms of Servicr")
      
      -- Sends a message to the person
      
      if defChatSys:FindFirstChild('SayMessageRequest') and NightTable.am.enabled then 
                defChatSys.SayMessageRequest:FireServer('/w ' .. r .. ' ' .. NightTable.am.Message, "All")
            end
        end
    end
end

local chatvent = defChatSys:FindFirstChild('OnMessageDoneFiltering')
chatvent.OnClientEvent:Connect(function(msgdata)
    if tostring(msgdata.FromSpeaker) ~= playS.LocalPlayer.Name then
        processMessages(tostring(msgdata.Message), tostring(msgdata.FromSpeaker))
    end
end)
