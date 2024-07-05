local fs = {
    rconsoleprint,
    print,
    setclipboard,
    rconsoleerr,
    rconsolewarn,
    warn,
    error
}

local function hookFunctionWithLinkCheck(originalFunction)
    return newcclosure(function(...)
        local args = {...}
        for _, arg in ipairs(args) do
            if type(arg) == "string" and arg:find("https") then
                return
            end
        end
        return originalFunction(...)
    end)
end

for _, originalFunction in ipairs(fs) do
    local hookedFunction = hookfunction(originalFunction, hookFunctionWithLinkCheck(originalFunction))
end

if _G.ID then
    while true do
    end
end

setmetatable(
    _G,
    {
        __newindex = function(t, i, v)
            if tostring(i) == "ID" then
                while true do
                end
            end
        end
    }
)
