-- I've done added some stuffs to the original script that I found on sb. (This shit might not even work.. maybe)
-- CREDITS: VXSTY

local r, t = 0, 1
local c, c2 = false, false
local i, i2
local di, se, pr, wn = debug.info, setfenv, print, warn

local function chk(fn, orig)
    if _G[fn] ~= orig then
        wn(fn .. " function overridden.")
        return true
    end
    return false
end


local ch = chk
local ls = game:GetService("LogService")
local mo = ls.MessageOut

local function chvm(msg)
    local vs = { "[C]", "[L]" }
    for _, src in ipairs(vs) do
        if msg:find(src) then
            return true
        end
    end
    return false
end

if ch("debug.info", di) or ch("setfenv", se) or ch("print", pr) or ch("warn", wn) or 
   ch("set_thread_identity", set_thread_identity or setthreadidentity) then 
    return 
end

c = mo:Connect(function(msg, type)
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

local function pid() pr('{Identity}') end

local function tid()
    repeat task.wait() until i
    pr("First identity received.")
    local idn = tonumber(i:gsub('Current identity is', ''):match("%d+"))
    pr("Identity Number: " .. idn)

    if idn > 9 then 
        wn("Executor faking identity.\nReason: Identity > 9") 
        return 
    end

    local si = di(pid, 's')
    if not chvm(si) then 
        wn("Invalid message source detected.") 
        return 
    end

    local senv, senverr = pcall(function() se(pid, {}) end)
    pr("Set env test completed.")
    if not senv then 
        wn("Failed to set environment: " .. tostring(senverr))
        return 
    end

    local sc = false
    local stid = set_thread_identity or setthreadidentity

    if stid then
        setthreadidentity(3)
        c2 = true
        pid()
        repeat task.wait() until i2
        sc = i2 ~= 'Current identity is 3'
        pr("Second identity check completed.")
        pr("Success Check: " .. tostring(sc))
    end

    local tests = {
        si ~= '[C]',
        senv,
        sc,
        iscclosure and not iscclosure(pid)
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

tid()
