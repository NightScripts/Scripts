local rs = game:GetService("ReplicatedStorage")
local pl = game:GetService("Players")
local hs = game:GetService("HttpService")
local ms = game:GetService("MarketplaceService")

local nt = {
    e = true,
    am = {
        e = true,
        m = {
            ["bullying"] = "no bully",
            ["swearing"] = "STOPPPPPPPPPPPPPPPPPP"
        }
    }
}

local mm = {
    ["fat"] = "Bullying",
    ["you fat"] = "Bullying",
    ["you suck"] = "Bullying",
    ["trash"] = "Bullying"
    -- [ Add Messages Here. ]
    -- [ Syntax: ["Key"] = "Value", ]
    -- [ Value List: Bullying, Dating, Swearing, Scamming, Offsite Links, Swearing, Inappropriate Content, Personal Information]
}

local function pm(m, pn)
    if not nt.e then
        return
    end
    
    for k, r in pairs(mm) do
        if string.find(string.lower(m), k) then
            pl:ReportAbuse(pl[pn], r, "Breaking Roblox Terms of Service")
            wait(1)
            
            if nt.am.e then
                local rm = nt.am.m[r]
                if rm then
                    local sp = rs:FindFirstChild("DefaultChatSystemChatEvents")
                    if sp and sp:FindFirstChild("SayMessageRequest") then
                        sp.SayMessageRequest:FireServer('/w ' .. pn .. ' ' .. rm, "All")
                    end
                end
            end
            break
        end
    end
end

local cs = rs:FindFirstChild("DefaultChatSystemChatEvents")
if cs then
    local om = cs:FindFirstChild("OnMessageDoneFiltering")
    if om then
        om.OnClientEvent:Connect(function(md)
            local m = tostring(md.Message)
            local pn = tostring(md.FromSpeaker)
            
            if pn ~= pl.LocalPlayer.Name then
                pm(m, pn)
            end
        end)
    end
end
