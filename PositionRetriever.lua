local sg, err = pcall(function()
    local sg = Instance.new("ScreenGui", game.Players.LocalPlayer:WaitForChild("PlayerGui"))
    sg.ResetOnSpawn = false

    local nf = Instance.new("Frame", sg)
    nf.Size, nf.Position, nf.BackgroundColor3, nf.BackgroundTransparency, nf.BorderSizePixel = UDim2.new(0.3, 0, 0.2, 0), UDim2.new(0.7, 0, 0.7, 0), Color3.fromRGB(40, 40, 40), 0.3, 0

    local function df(nf)
        local UIS, dt, di, ds, sp = game:GetService("UserInputService"), nil, nil, nil, nil
        local function upi(i)
            local d = i.Position - ds
            nf.Position = UDim2.new(sp.X.Scale, sp.X.Offset + d.X, sp.Y.Scale, sp.Y.Offset + d.Y)
        end
        nf.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
                dt = true
                ds, sp = i.Position, nf.Position
                i.Changed:Connect(function()
                    if i.UserInputState == Enum.UserInputState.End then
                        dt = false
                    end
                end)
            end
        end)
        nf.InputChanged:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch then
                if dt then
                    upi(i)
                end
            end
        end)
    end
    df(nf)

    local ntl = Instance.new("TextLabel", nf)
    ntl.Size, ntl.Position, ntl.BackgroundTransparency, ntl.TextColor3, ntl.Font, ntl.TextSize, ntl.TextWrapped, ntl.TextXAlignment, ntl.TextYAlignment = UDim2.new(1, 0, 0.6, 0), UDim2.new(0, 0, 0, 0), 1, Color3.fromRGB(255, 255, 255), Enum.Font.SourceSans, 18, true, Enum.TextXAlignment.Center, Enum.TextYAlignment.Center

    local nb = Instance.new("TextButton", nf)
    nb.Size, nb.Position, nb.BackgroundColor3, nb.TextColor3, nb.Font, nb.TextSize, nb.Text = UDim2.new(0.8, 0, 0.3, 0), UDim2.new(0.1, 0, 0.65, 0), Color3.fromRGB(80, 80, 80), Color3.fromRGB(255, 255, 255), Enum.Font.SourceSans, 18, "Copy Position"

    local uic = Instance.new("UICorner", nb)
    uic.CornerRadius = UDim.new(0, 12)

    local function upp()
        local p = game.Players.LocalPlayer
        if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            ntl.Text = tostring(p.Character.HumanoidRootPart.Position)
        else
            error("pos nf")
        end
    end

    game:GetService("RunService").RenderStepped:Connect(upp)

    local be = Instance.new("BlurEffect", game.Lighting)
    be.Size, be.Enabled = 10, false

    local function sbe(e)
        be.Enabled = e
    end

    nf.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            sbe(true)
        end
    end)

    nf.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            sbe(false)
        end
    end)

    nb.MouseButton1Click:Connect(function()
        local p = game.Players.LocalPlayer
        if p and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            setclipboard(tostring(p.Character.HumanoidRootPart.Position))
        else
            error("Failed to copy position.")
        end
    end)
end)

if not sg then
    error("Failed to create ScreenGui.")
end

if not nf then
    error("Frame creation oof.")
end

if not df then
    error("Dragify oops.")
end

if not ntl then
    error("label broke")
end

if not nb then
    error("buttfail")
end

if not upp then
    error("pos flew wewww")
end

if not be then
    error("BlurEffect woosh")
end

if not sbe then
    error("Blur died")
end

if not error then
    error("error = error real")
end
