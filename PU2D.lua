--// Port UI to Drag.lua
--// Basically makes a specific gui obj to be Draggable 
--// Why do i made this, it's not even probably gonna work cuz i was sleepy as fuck making this.
--// Yeah

local Port = {}
local Settings = {
    ["Motion_Blur"] = true,
    ["Check_String"] = true,
    ["Debug"] = true
}

function Port:Draggable(guiElementName)
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local guiElement = playerGui:FindFirstChild(guiElementName)
    local debug = setmetatable({}, {
        __index = function(_, key)
            if Settings["Debug"] then
                local logPrefix = "[DEBUG]: "
                local func = function(message)
                    print(logPrefix .. message)
                end
                return func
            end
            return function() end
        end
    })

    local function T(str1, str2)
        local len1 = #str1
        local len2 = #str2
        local d = {}
        for i = 0, len1 do
            d[i] = {}
            d[i][0] = i
        end
        for j = 0, len2 do
            d[0][j] = j
        end
        for i = 1, len1 do
            for j = 1, len2 do
                local cost = (str1:sub(i, i) == str2:sub(j, j)) and 0 or 1
                d[i][j] = math.min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1] + cost)
            end
        end
        return d[len1][len2]
    end

    local function FCM(playerGui, guiElementName)
        local bestMatch, lowestDistance = nil, math.huge
        for _, element in pairs(playerGui:GetChildren()) do
            local distance = T(element.Name, guiElementName)
            if distance < lowestDistance then
                bestMatch, lowestDistance = element, distance
            end
        end
        return bestMatch
    end
  
    local function AMB(guiElement)
        if Settings["Motion_Blur"] then
            local blurEffect = Instance.new("BlurEffect")
            blurEffect.Size = 10
            blurEffect.Parent = game.Lighting
            guiElement.AncestryChanged:Connect(function()
                blurEffect:Destroy()
            end)
            guiElement.InputChanged:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.Touch then
                    blurEffect.Size = 15
                end
            end)
        end
    end

    if not guiElement or not guiElement:IsA("GuiObject") then
        if Settings["Check_String"] then
            local bestMatch = FCM(playerGui, guiElementName)
            if bestMatch then
                debug("Resolved typo: '" .. guiElementName .. "' did not exist, using closest match: '" .. bestMatch.Name .. "'")
                guiElement = bestMatch
            else
                warn("Port:Draggable() - Could not resolve '" .. guiElementName .. "' to a valid GuiObject")
                return
            end
        else
            warn("Port:Draggable() - Could not find a valid GuiObject with the name: " .. guiElementName)
            return
        end
    end
    local deviceType = game:GetService("UserInputService").TouchEnabled and "Mobile" or "PC"
    debug("Player Device: " .. deviceType)
    local mouse = player:GetMouse()
    local dragging, dragStart, startPos = false, nil, nil
    if Settings["Motion_Blur"] then
        AMB(guiElement)
    end
    guiElement.InputBegan:Connect(function(input)
        debug("Input started: " .. input.UserInputType)

        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging, dragStart, startPos = true, input.Position, guiElement.Position
            debug("Dragging started at position: " .. tostring(dragStart))

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    debug("Dragging ended.")
                end
            end)
        end
    end)
    guiElement.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            guiElement.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            debug("Dragging to position: " .. tostring(guiElement.Position))
        end
    end)
end

return Port

--[[ Usage: load this as a loadstring then
Port:Draggable("Gui shit here")
]]--
