local function rfn(fn, orig)
    local ofn = _G[fn]
    if ofn ~= orig then
        _G[fn] = orig
        warn(fn .. " function restored.")
    end
end

local function sv()
    local function ic()
        local f = {
            debug.info, setfenv, print, warn, task.spawn, game.GetService
        }
        for _, fn in ipairs(f) do
            if not fn or type(fn) ~= "function" then
                return false
            end
        end
        return true
    end

    if not ic() then
        warn("Critical functions compromised. Reinitializing...")
        task.spawn(mn)
    else
        rfn("debug.info", di)
        rfn("setfenv", se)
        rfn("print", pr)
        rfn("warn", wn)
        rfn("set_thread_identity", set_thread_identity or setthreadidentity)
    end
end

local r, t = 0, 1
local c, c2 = false, false
local i, i2
local di, se, pr, wn = debug.info, setfenv, print, warn

local function chk(fn, orig)
    if _G[fn] ~= orig then
        wn(fn .. " overridden.")
        rfn(fn, orig)
        return true
    end
    return false
end

local function pc()
    while true do
        task.wait(30)
        if chk("debug.info", di) or chk("setfenv", se) or chk("print", pr) or chk("warn", wn) or 
           chk("set_thread_identity", set_thread_identity or setthreadidentity) then 
            wn("Function integrity compromised.")
            sv()
            return false
        end
        sv()
    end
end

local function cv(msg)
    local vs = { "[C]", "[L]" }
    for _, src in ipairs(vs) do
        if msg:find(src) then
            return true
        end
    end
    return false
end

local function pi() pr('{Identity}') end

local function ti()
    repeat task.wait() until i
    pr("First identity received.")
    local idn = tonumber(i:gsub('Current identity is', ''):match("%d+"))
    pr("Identity Number: " .. idn)

    if idn >= 100 then 
        wn("Executor faking identity.\nReason: Identity >= 100") 
        return 
    end

    local si = di(pi, 's')
    if not cv(si) then 
        wn("Invalid message source detected.") 
        return 
    end

    local senv, err = pcall(function() se(pi, {}) end)
    pr("Set env test completed.")
    if not senv then 
        wn("Failed to set environment: " .. tostring(err))
        return 
    end

    local sc = false
    local stid = set_thread_identity or setthreadidentity

    if stid then
        setthreadidentity(3)
        c2 = true
        pi()
        repeat task.wait() until i2
        sc = i2 ~= 'Current identity is 3'
        pr("Second identity check completed.")
        pr("Success Check: " .. tostring(sc))
    end

    local tests = {
        si ~= '[C]',
        senv,
        sc,
        iscclosure and not iscclosure(pi)
    }

    local results = {
        'Creates a fake function by doing:\nfunction printIdentity()\n print(\'{Identity}\')\nend',
        'Creates a fake function and tries to hide it with newcclosure.',
        'Detected by its own set_thread_identity.',
        'Same as test #1'
    }

    for idx, val in ipairs(tests) do
        if val then 
            wn("Test #" .. idx .. ": Executor fakes identity, here's how: " .. results[idx]) 
        end
    end

    if #tests == 0 then 
        pr("Executor does not fake identity!\nIdentity: " .. idn) 
        r = r + 1 
    end

    pr("Executor rating: " .. (r / t) * 100 .. "%.")
end

local function mn()
    if not chk("debug.info", di) and not chk("setfenv", se) and not chk("print", pr) and not chk("warn", wn) and
       not chk("set_thread_identity", set_thread_identity or setthreadidentity) then 

        c = game:GetService("LogService").MessageOut:Connect(function(msg, type)
            if msg:find("Current identity is") then 
                i = msg 
                pr("Identity captured: " .. msg) 
            end
            if c2 then 
                i2 = msg 
                pr("Second identity captured: " .. msg) 
                c:Disconnect() 
            end
        end)

        task.spawn(pc)
        ti()
    else
        wn("Initial integrity check failed.")
    end
end

mn()
task.spawn(mn)

-- How high is the protection level 1 out of 100
-- My bro: 1/100 (Really accurate no cap and shit)
