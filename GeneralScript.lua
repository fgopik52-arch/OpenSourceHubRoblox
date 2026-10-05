-- ============================================================
--  BLACKBOX HUB x genceo
--  Rayfield UI + Discord tab + 20 games + 5 universal
--  GitHub: fgopik52-arch/OpenSourceHubRoblox
-- ============================================================

if not game:IsLoaded() then game.Loaded:Wait() end
if not getgenv then
    warn("[Blackbox] Требуется экзекьютор с getgenv()")
    return
end

local Players     = game:GetService("Players")
local CoreGui     = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- ============================================================
--  GITHUB CONFIG
-- ============================================================
local GITHUB_USER = "fgopik52-arch"
local GITHUB_REPO = "OpenSourceHubRoblox"
local AVATAR_FILE = "Anjinho.jpeg"

local AVATAR_URL = ("https://raw.githubusercontent.com/%s/%s/refs/heads/main/%s")
    :format(GITHUB_USER, GITHUB_REPO, AVATAR_FILE)

-- ============================================================
--  RAYFIELD LOAD
-- ============================================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
    Title = "Blackbox Hub",
    Content = "Загрузка интерфейса...",
    Duration = 3,
    Image = 4483362458,
})

-- ============================================================
--  WINDOW
-- ============================================================
local Window = Rayfield:CreateWindow({
    Name = "Blackbox Hub | genceo",
    Icon = 0,
    LoadingTitle = "Blackbox Hub",
    LoadingSubtitle = "by genceo",
    Theme = "Amethyst",

    ToggleUIKeybind = "K",

    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = false,
        FolderName = nil,
        FileName = "BlackboxHub"
    },

    Discord = {
        Enabled = false,
        Invite = "",
        RememberJoins = false
    },

    KeySystem = false,
})

-- ============================================================
--  АВАТАРКА ИЗ GITHUB (круглая, в левом верхнем углу)
-- ============================================================
local avatarScreen = Instance.new("ScreenGui")
avatarScreen.Name = "BlackboxAvatar"
avatarScreen.ResetOnSpawn = false
avatarScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
avatarScreen.Parent = (gethui and gethui()) or CoreGui

local avatar = Instance.new("ImageLabel")
avatar.Name = "genceoAvatar"
avatar.Size = UDim2.new(0, 64, 0, 64)
avatar.Position = UDim2.new(0, 12, 0, 12)
avatar.BackgroundTransparency = 1
avatar.Image = AVATAR_URL
avatar.ZIndex = 5
avatar.Parent = avatarScreen

local avatarCorner = Instance.new("UICorner")
avatarCorner.CornerRadius = UDim.new(1, 0)
avatarCorner.Parent = avatar

local avatarStroke = Instance.new("UIStroke")
avatarStroke.Color = Color3.fromRGB(140, 100, 255)
avatarStroke.Thickness = 2
avatarStroke.Parent = avatar

-- ============================================================
--  DISCORD TAB (синяя иконка + кнопка Close)
-- ============================================================
local DiscordTab = Window:CreateTab("Discord", 4483362458)

DiscordTab:CreateSection("Discord — @genceo")

DiscordTab:CreateButton({
    Name = "Закрыть / Close",
    Callback = function()
        Rayfield:Notify({
            Title = "@genceo",
            Content = "Ну окей :(",
            Duration = 5,
            Image = 4483362458,
            Actions = {
                Ignore = {
                    Name = "Понял",
                    Callback = function() end
                }
            }
        })

        task.wait(0.3)

        -- Уничтожаем Rayfield и аватарку
        Rayfield:Destroy()
        if avatarScreen then avatarScreen:Destroy() end
    end,
})

DiscordTab:CreateSection("Ссылки")

DiscordTab:CreateButton({
    Name = "Скопировать Discord-приглашение",
    Callback = function()
        if setclipboard then
            setclipboard("https://discord.gg/ТВОЙ_ИНВАЙТ")
            Rayfield:Notify({
                Title = "Discord",
                Content = "Инвайт скопирован в буфер.",
                Duration = 3,
                Image = 4483362458,
            })
        end
    end,
})

-- ============================================================
--  MAIN TAB
-- ============================================================
local MainTab = Window:CreateTab("Главная", 0)

MainTab:CreateSection("Профиль")

MainTab:CreateParagraph({
    Title = "Blackbox Hub",
    Content = "Версия 1.0 | by genceo | 20 игр + 5 universal | GitHub avatar"
})

MainTab:CreateButton({
    Name = "Показать аватарку (URL)",
    Callback = function()
        Rayfield:Notify({
            Title = "genceo",
            Content = AVATAR_URL,
            Duration = 6,
            Image = 4483362458,
        })
    end,
})

-- ============================================================
--  ИГРЫ (20) + UNIVERSAL (5)
-- ============================================================
local GamesTab     = Window:CreateTab("Игры (20)", 0)
local UniversalTab = Window:CreateTab("Universal (5)", 0)

-- ВСТАВЬ СВОИ URL ВМЕСТО example.com
local Games = {
    {name = "Brookhaven RP",             url = "https://example.com/brookhaven.lua"},
    {name = "Blox Fruits",               url = "https://example.com/bloxfruits.lua"},
    {name = "Rivals",                    url = "https://example.com/rivals.lua"},
    {name = "Street Life Remastered",    url = "https://example.com/streetlife.lua"},
    {name = "Ohio",                      url = "https://example.com/ohio.lua"},
    {name = "Arsenal",                   url = "https://example.com/arsenal.lua"},
    {name = "Murder Mystery 2",          url = "https://example.com/mm2.lua"},
    {name = "Jailbreak",                 url = "https://example.com/jailbreak.lua"},
    {name = "BedWars",                   url = "https://example.com/bedwars.lua"},
    {name = "Fisch",                     url = "https://example.com/fisch.lua"},
    {name = "Grow a Garden",             url = "https://example.com/growgarden.lua"},
    {name = "Dead Rails",                url = "https://example.com/deadrails.lua"},
    {name = "The Strongest Battlegrounds", url = "https://example.com/tsb.lua"},
    {name = "Evade",                     url = "https://example.com/evade.lua"},
    {name = "Blue Lock: Rivals",         url = "https://example.com/bluelock.lua"},
    {name = "99 Nights in the Forest",   url = "https://example.com/99nights.lua"},
    {name = "Pet Simulator 99",          url = "https://example.com/ps99.lua"},
    {name = "Adopt Me",                  url = "https://example.com/adoptme.lua"},
    {name = "Tower Defense Simulator",   url = "https://example.com/tds.lua"},
    {name = "Anime Vanguards",           url = "https://example.com/animevanguards.lua"},
}

local Universals = {
    {name = "Universal ESP",           url = "https://example.com/esp.lua"},
    {name = "Universal Speed",         url = "https://example.com/speed.lua"},
    {name = "Universal Fly",           url = "https://example.com/fly.lua"},
    {name = "Universal Infinite Jump", url = "https://example.com/infinitjump.lua"},
    {name = "Universal Aimbot",        url = "https://example.com/aimbot.lua"},
}

local function runScript(url, label)
    if not url or url:find("example.com") then
        Rayfield:Notify({
            Title = "Blackbox Hub",
            Content = "URL для " .. label .. " не настроен.",
            Duration = 4,
            Image = 4483362458,
        })
        return
    end

    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)

    if ok then
        Rayfield:Notify({
            Title = "Успех",
            Content = label .. " загружен.",
            Duration = 3,
            Image = 4483362458,
        })
    else
        Rayfield:Notify({
            Title = "Ошибка",
            Content = label .. ": " .. tostring(err):sub(1, 60),
            Duration = 5,
            Image = 4483362458,
        })
    end
end

GamesTab:CreateSection("Популярные игры")

for _, g in ipairs(Games) do
    GamesTab:CreateButton({
        Name = g.name,
        Callback = function() runScript(g.url, g.name) end,
    })
end

UniversalTab:CreateSection("Универсальные скрипты")

for _, u in ipairs(Universals) do
    UniversalTab:CreateButton({
        Name = u.name,
        Callback = function() runScript(u.url, u.name) end,
    })
end

-- ============================================================
--  ФИНАЛЬНОЕ УВЕДОМЛЕНИЕ
-- ============================================================
Rayfield:Notify({
    Title = "Blackbox Hub готов",
    Content = "Открыто. Клавиша: K",
    Duration = 4,
    Image = 4483362458,
})

print("[Blackbox Hub] Загружено. Discord: @genceo")
