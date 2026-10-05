-- ============================================================
--  BLACKBOX HUB x genceo
--  Rayfield UI + Games + Universal | keyless
-- ============================================================

if not game:IsLoaded() then game.Loaded:Wait() end
if not getgenv then
    warn("[Blackbox] Requires getgenv()")
    return
end

local Players     = game:GetService("Players")
local CoreGui     = cloneref and cloneref(game:GetService("CoreGui")) or game:GetService("CoreGui")

-- ============================================================
--  RAYFIELD
-- ============================================================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

Rayfield:Notify({
    Title = "Blackbox Hub",
    Content = "Loading...",
    Duration = 3,
    Image = 4483362458,
})

local Window = Rayfield:CreateWindow({
    Name = "Blackbox Hub | genceo",
    Icon = 0,
    LoadingTitle = "Blackbox Hub",
    LoadingSubtitle = "by genceo",
    Theme = "Amethyst",
    ToggleUIKeybind = "K",
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
    ConfigurationSaving = { Enabled = false, FolderName = nil, FileName = "BlackboxHub" },
    Discord = { Enabled = false, Invite = "", RememberJoins = false },
    KeySystem = false,
})

-- ============================================================
--  DISCORD TAB (Close only)
-- ============================================================
local DiscordTab = Window:CreateTab("Discord", 4483362458)

DiscordTab:CreateSection("Discord — @genceo")

DiscordTab:CreateButton({
    Name = "Close / Закрыть",
    Callback = function()
        Rayfield:Notify({
            Title = "@genceo",
            Content = "Ну окей :(",
            Duration = 5,
            Image = 4483362458,
        })
        task.wait(0.5)
        Rayfield:Destroy()
    end,
})

-- ============================================================
--  MAIN
-- ============================================================
local MainTab = Window:CreateTab("Главная", 0)

MainTab:CreateSection("Info")
MainTab:CreateParagraph({
    Title = "Blackbox Hub",
    Content = "v1.0 | by genceo | keyless games + universal"
})

-- ============================================================
--  GAMES (keyless, verified from search)
-- ============================================================
local GamesTab     = Window:CreateTab("Игры", 0)
local UniversalTab = Window:CreateTab("Universal", 0)

local Games = {
    -- Brookhaven (two options)
    {name = "Brookhaven (Kaiser)",      url = "https://raw.githubusercontent.com/SUPREMEAURA350/KAISER-VERSION-2-/refs/heads/main/Kaiserspam"},
    {name = "Brookhaven (Ishaxann Fonts)", url = "https://gist.githubusercontent.com/ishaxannop/744b241865df726ef55feb171342ffc6/raw/a25d9be54eb7cc7f37577171d2d5d561901cc29b/Ishaxann's%2520Fonts"},

    -- Rivals (two options)
    {name = "Rivals (JN HH)",           url = "https://raw.githubusercontent.com/JNHHGaming/Rivals8/refs/heads/main/JN%20HH%20Gaming"},
    {name = "Rivals (Korax)",           url = "https://raw.githubusercontent.com/imshrak/rivals/refs/heads/main/main"},

    -- Arsenal (three options)
    {name = "Arsenal (ArsenalFun V2)",  url = "https://raw.githubusercontent.com/AverageAftermath/ArsenalFun/refs/heads/main/ArsenalFunV2"},
    {name = "Arsenal (Catware)",        url = "https://catware.xyz/Arsenal.lua"},

    -- The Strongest Battlegrounds
    {name = "The Strongest Battlegrounds (KittyWare)", url = "https://raw.githubusercontent.com/0mam0ri/KittyWare/refs/heads/main/obf.lua"},
    {name = "The Strongest Battlegrounds (Spark Hub)", url = "https://raw.githubusercontent.com/ultimatep568/Spark-Hub/refs/heads/main/SparkHub_Loader.lua"},

    -- Blue Lock Rivals
    {name = "Blue Lock Rivals",         url = "https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/refs/heads/main/Blue%20Lock%20Rivals%20GUI"},

    -- Fisch
    {name = "Fisch (MUR4)",             url = "https://gist.githubusercontent.com/Mur4exe/af4ce068bd4910ff0e5715cd0215c143/raw/f3f36618e23d29d064618d1c573ab29e2e407f71/F%25C4%25B0SHv2.lua"},

    -- Grow a Garden
    {name = "Grow a Garden (Rblxshop)", url = "https://raw.githubusercontent.com/rblxshop/Rblxscripts/refs/heads/main/GAG.lua"},
    {name = "Grow a Garden (Milk)",     url = "https://raw.githubusercontent.com/the-amazing-digital-circus/Milk/main/126884695634066"},

    -- Adopt Me
    {name = "Adopt Me (House Cloner)",  url = "https://raw.githubusercontent.com/swiftasfboi/AdoptMe/refs/heads/main/HouseCloner"},
    {name = "Adopt Me (Seraphis)",      url = "https://raw.githubusercontent.com/eIysia-dev/best/refs/heads/main/loader"},
    {name = "Adopt Me (ByteLaunch)",    url = "https://raw.githubusercontent.com/bytelaunch-germany/adoptme-candyegg-farmer2026/main/loader.lua"},

    -- Pet Simulator 99
    {name = "Pet Simulator 99",         url = "https://raw.githubusercontent.com/demonlordscript-create/-Plant-vs-Coin-Part-2-Script-Free-Keyless-Auto-Place-Auto-Rebirth/refs/heads/main/ps99%20new%20script%20updated%20plant%20vs%20coin"},

    -- Tower Defense Simulator
    {name = "Tower Defense Simulator (Pick Hub)", url = "http://pickscripthub.xyz/load/TDSMultiLoader.lua"},
    {name = "Tower Defense Simulator (Sosika)",   url = "https://raw.githubusercontent.com/sosiskascriptv3/tds-auto-farm-money-and-xp/refs/heads/main/lkj"},

    -- Anime Vanguards
    {name = "Anime Vanguards (DollarHub)", url = "https://dollarhub.space/script/loader.lua"},
    {name = "Anime Vanguards (Luarmor)",   url = "https://api.luarmor.net/files/v3/loaders/e3cc7e48055222fbdc0e3228a36766a6.lua"},

    -- Universal / Multi-game
    {name = "Fractured Hub (TDS/Anime/Universal)", url = "https://api.luarmor.net/files/v4/loaders/f03a4b5f7f83de69bd5d1a34bc193eab.lua"},
}

-- ============================================================
--  UNIVERSAL (5)
-- ============================================================
local Universals = {
    {name = "Universal ESP",           url = "https://pastefy.app/VKpXX0pO/raw"},
    {name = "Universal Fly/Noclip/Speed", url = "https://pastebin.com/raw/Ju5wjjbe"},
    {name = "Universal Infinite Jump", url = "https://pastebin.com/raw/gsSkY3ji"},
    {name = "Universal Vidas Hub",     url = "https://pastebin.com/raw/1K0n4K7q"},
    {name = "Sephirre Hub (Universal)", url = "https://scriptblox.com/script/Universal-Script-Sepphire-Hub-79635"},
}

-- ============================================================
--  RUNNER
-- ============================================================
local function runScript(url, label)
    if not url or url == "" then
        Rayfield:Notify({ Title = "Blackbox", Content = label .. ": no URL", Duration = 3, Image = 4483362458 })
        return
    end

    local ok, err = pcall(function()
        loadstring(game:HttpGet(url))()
    end)

    if ok then
        Rayfield:Notify({ Title = "OK", Content = label .. " loaded", Duration = 3, Image = 4483362458 })
    else
        Rayfield:Notify({ Title = "Error", Content = label .. ": " .. tostring(err):sub(1, 60), Duration = 5, Image = 4483362458 })
    end
end

-- ============================================================
--  BUTTONS
-- ============================================================
GamesTab:CreateSection("Games (keyless)")

for _, g in ipairs(Games) do
    GamesTab:CreateButton({
        Name = g.name,
        Callback = function() runScript(g.url, g.name) end,
    })
end

UniversalTab:CreateSection("Universal (keyless)")

for _, u in ipairs(Universals) do
    UniversalTab:CreateButton({
        Name = u.name,
        Callback = function() runScript(u.url, u.name) end,
    })
end

-- ============================================================
--  FOOTER
-- ============================================================
Rayfield:Notify({
    Title = "Blackbox Hub",
    Content = "Ready. Key: K",
    Duration = 4,
    Image = 4483362458,
})

print("[Blackbox Hub] Loaded. @genceo")
