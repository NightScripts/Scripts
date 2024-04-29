local arceus;
for i, v in next, getgc(true) do
    if typeof(v) == "table" and rawget(v, "isarceusfolder") and typeof(rawget(v, "isarceusfolder")) == "function" then    
        arceus = v
    end
end

local decrypt = arceus.readarceusfile("Configs/auth.ax")
local hwid = gethwid()
local year = math.random(2025, 2029)
math.randomseed(os.time())
encryptDecrypt = function(data, key)
    local output = {}
    for i = 1, #data do
        local charValue = string.byte(data, i)
        local keyValue = string.byte(key, (i - 1) % 3 + 1)
        table.insert(output, string.char(bit32.bxor(charValue, keyValue)))
    end
    return table.concat(output)
end



local Auth = encryptDecrypt(decrypt, "AXAuth" .. hwid)
local HttpService = game:GetService("HttpService")
local DD = HttpService:JSONDecode(Auth)

DD.hwid = hwid
DD.loadTime = os.time()
DD.info.expires = tostring(year).."-10-19T00:37:57.982Z"
DD.info.authenticated = true
DD.info.expiring = 9999999999999999999999999999
DD.info.rand_change = "a"
DD.info.time = "2024-04-28T17:37:57.982Z"
DD.info.plan = 0
decodedData.info.isPremium = false
local encodedData = HttpService:JSONEncode(decodedData)
arceus.writearceusfile("Configs/auth.ax",encryptDecrypt(encodedData, "AXAuth" .. hwid))
