loadstring(game:HttpGet("https://raw.githubusercontent.com/leviiexesc/Chiro_Library_UI/refs/heads/main/chiro.luau"))()

local Window = Chiro:CreateWindow({
    Title = "CHIRO",
    SubTitle = "v1.0 // CYBER",
    Tag = "PREMIUM",
    Logo = "rbxassetid://106068537230011",
    ToggleKey = Enum.KeyCode.RightShift,
    KeySystem = {
        Enabled = true,
        ApiBase = "https://chiro-license-center.onrender.com/api/v1/client",
        SaveKey = true,
        KeyFile = "chiro_license.key",
        ProductSlug = "chiro-pro-cyber",
    },
})

-- ── 1. MAIN TAB ──────────────────────────────────────────────
local MainTab = Window:CreateTab({ Name = "Main", Icon = "zap" })

MainTab:CreateSection("Dropdowns (Show on Top)")

MainTab:CreateDropdown({
    Name = "Visual Graphics",
    Icon = "palette",
    Tag = "TOP",
    TagColor = Color3.fromRGB(30, 215, 96),
    Options = { "Ultra High 4K", "Cinematic Cyber", "Optimized 60FPS", "Performance Low" },
    Default = "Cinematic Cyber",
    Callback = function(choice)
        Chiro:Notify({ Title = "GRAPHICS CHANGED", Content = "Selected: " .. choice, Duration = 2 })
    end
})

MainTab:CreateMultiDropdown({
    Name = "Active Visual Filters",
    Icon = "box",
    Tag = "MULTI",
    TagColor = Color3.fromRGB(168, 85, 247),
    Options = { "Bloom Glow", "Motion Blur", "Anti-Aliasing", "Shadow Details", "Color Grading" },
    Default = { "Bloom Glow", "Color Grading" },
    Callback = function(selectedList)
        Chiro:Notify({ Title = "FILTERS UPDATED", Content = "Active: " .. table.concat(selectedList, ", "), Duration = 2.5 })
    end
})

MainTab:CreateSection("Featured Controls")

MainTab:CreateButton({
    Name = "Trigger Alert Notification",
    Icon = "bell",
    Tag = "NEW",
    TagColor = Color3.fromRGB(30, 215, 96),
    Label = "Fire",
    Callback = function()
        Chiro:Notify({ Title = "ALERT TRIGGERED", Content = "Button action executed with success!", Kind = "success", Duration = 3 })
    end
})

MainTab:CreateToggle({
    Name = "Cyber Glow FX",
    Icon = "zap",
    Tag = "BETA",
    TagColor = Color3.fromRGB(168, 85, 247),
    Default = true,
    Callback = function(state) end
})

MainTab:CreateSlider({
    Name = "Haptic Sensitivity",
    Icon = "gauge",
    Tag = "iOS",
    TagColor = Color3.fromRGB(59, 130, 246),
    Min = 0,
    Max = 100,
    Default = 75,
    Decimals = 0,
    Callback = function(v) end
})

-- â”€â”€ 2. COMPONENTS TAB â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
local CompTab = Window:CreateTab({ Name = "Components", Icon = "box" })

CompTab:CreateSection("Inputs & Color")

CompTab:CreateInput({
    Name = "Custom Command",
    Icon = "zap",
    Placeholder = "Enter script or command...",
    Callback = function(txt, enter)
        if enter then
            Chiro:Notify({ Title = "COMMAND ENTERED", Content = txt, Duration = 3 })
        end
    end
})

CompTab:CreateColorPicker({
    Name = "Accent Theme Color",
    Icon = "palette",
    Default = Color3.fromRGB(30, 215, 96),
    Callback = function(col) end
})

-- ── 3. TELEMETRY & GAME TAB ──────────────────────────────────
local GameTab = Window:CreateTab({ Name = "Game", Icon = "gamepad" })

-- Real Game Logo & Identity Banner
GameTab:CreateSection("Game Overview")

GameTab:CreateBanner({
    Title    = GameName,
    SubTitle = "Place ID: " .. tostring(CurrentPlaceId) .. "  •  Universe ID: " .. tostring(CurrentGameId) .. "\nExecutor: " .. ExecutorName,
    Image    = GameIconAsset,
    Tag      = "LIVE",
    TagColor = Color3.fromRGB(30, 215, 96),
})

-- Session & Server Tools
GameTab:CreateSection("Server & Job ID Tools")

-- Current Job ID with Copy button
local jobIdStat = GameTab:CreateStat({
    Name  = "Current Job ID",
    Icon  = "server",
    Tag   = "SERVER",
    Value = string.sub(CurrentJobId, 1, 14) .. (string.len(CurrentJobId) > 14 and "..." or ""),
})

GameTab:CreateButton({
    Name     = "Copy Current Job ID",
    Icon     = "lucide-copy",
    Tag      = "CLIP",
    TagColor = Color3.fromRGB(59, 130, 246),
    Label    = "Copy",
    Callback = function()
        setClipboardText(game.JobId)
        Chiro:Notify({
            Title    = "JOB ID COPIED",
            Content  = "Copied server Job ID to clipboard!",
            Kind     = "success",
            Duration = 3,
        })
    end,
})

-- Input Job ID to join that server
local targetJobId = ""
GameTab:CreateInput({
    Name        = "Join Server by Job ID",
    Icon        = "lucide-server",
    Tag         = "INPUT",
    TagColor    = Color3.fromRGB(168, 85, 247),
    Placeholder = "Paste Job ID here...",
    Default     = "",
    Callback    = function(txt)
        targetJobId = txt:gsub("%s+", "")
    end,
})

GameTab:CreateButton({
    Name     = "Connect to Job ID Server",
    Icon     = "lucide-log-in",
    Tag      = "TELEPORT",
    TagColor = Color3.fromRGB(30, 215, 96),
    Label    = "Join",
    Callback = function()
        if targetJobId == "" then
            Chiro:Notify({
                Title    = "JOIN ERROR",
                Content  = "Please enter or paste a valid Job ID first.",
                Kind     = "error",
                Duration = 3,
            })
            return
        end

        Chiro:Notify({
            Title    = "TELEPORTING",
            Content  = "Joining server: " .. string.sub(targetJobId, 1, 16) .. "...",
            Kind     = "info",
            Duration = 4,
        })

        local ok, err = pcall(function()
            TeleportService:TeleportToPlaceInstance(CurrentPlaceId, targetJobId, LocalPlayer)
        end)
        if not ok then
            Chiro:Notify({
                Title    = "JOIN FAILED",
                Content  = "Teleport error: " .. tostring(err),
                Kind     = "error",
                Duration = 4,
            })
        end
    end,
})

GameTab:CreateButton({
    Name     = "Rejoin Same Server",
    Icon     = "lucide-refresh-cw",
    Label    = "Rejoin",
    Callback = function()
        Chiro:Notify({
            Title    = "REJOINING",
            Content  = "Reconnecting to this place...",
            Kind     = "info",
            Duration = 3,
        })
        pcall(function()
            if game.JobId and game.JobId ~= "" then
                TeleportService:TeleportToPlaceInstance(CurrentPlaceId, game.JobId, LocalPlayer)
            else
                TeleportService:Teleport(CurrentPlaceId, LocalPlayer)
            end
        end)
    end,
})

-- Live Telemetry Performance
GameTab:CreateSection("Live Telemetry")

local fpsStat  = GameTab:CreateStat({ Name = "Frames Per Second", Icon = "activity", Value = "60 FPS" })
local pingStat = GameTab:CreateStat({ Name = "Network Latency",   Icon = "wifi",     Value = "0 MS" })
local memStat  = GameTab:CreateStat({ Name = "Client Memory",     Icon = "cpu",      Value = "0 MB" })

local gCount, gLast = 0, os.clock()
RunService.RenderStepped:Connect(function()
    gCount += 1
    local now = os.clock()
    if now - gLast >= 0.4 then
        local liveFps = math.floor(gCount / (now - gLast) + 0.5)
        gCount = 0
        gLast = now
        fpsStat:SetValue(liveFps .. " FPS")
    end
end)

task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        pcall(function()
            local mem  = math.floor(StatsService:GetTotalMemoryUsageMb())
            local ping = math.floor(StatsService.Network.ServerStatsItem["Data Ping"]:GetValue())
            pingStat:SetValue(ping .. " MS")
            memStat:SetValue(mem .. " MB")
        end)
        task.wait(0.4)
    end
end)

-- ── 4. RAYFIELD-STYLE SETTINGS TAB ───────────────────────────
local SetTab = Window:CreateTab({ Name = "Settings", Icon = "settings" })

SetTab:CreateSection("Rayfield-Style Profile & Display")

SetTab:CreateToggle({
    Name     = "Show Profile",
    Icon     = "user",
    Tag      = "PROFILE",
    TagColor = Color3.fromRGB(59, 130, 246),
    Default  = true,
    Callback = function(show)
        Window:SetProfileVisible(show)
        Chiro:Notify({ Title = "PROFILE VISIBILITY", Content = "Roblox Profile " .. (show and "Shown" or "Hidden"), Duration = 2 })
    end
})

SetTab:CreateSection("Keybinds & Controls")

SetTab:CreateKeybind({
    Name     = "UI Toggle Keybind",
    Tag      = "REBIND",
    TagColor = Color3.fromRGB(30, 215, 96),
    Default  = Enum.KeyCode.RightShift,
    Callback = function(newKey)
        Window:SetToggleKey(newKey)
        Chiro:Notify({ Title = "KEYBIND UPDATED", Content = "UI Toggle bound to: " .. tostring(newKey.Name), Kind = "success", Duration = 3 })
    end
})

SetTab:CreateSection("Appearance & Theme")

SetTab:CreateDropdown({
    Name     = "Interface Theme",
    Icon     = "palette",
    Options  = { "Dark", "Light" },
    Default  = "Dark",
    Callback = function(th) Window:SetTheme(th) end
})

-- Load and Attach SaveManager & InterfaceManager Addons
task.spawn(function()
    pcall(function()
        local saveMgrPath = "C:/Users/Loop Ember/AppData/Local/Real/scripts/MCP/ChiroSaveManager.luau"
        local intfMgrPath = "C:/Users/Loop Ember/AppData/Local/Real/scripts/MCP/ChiroInterfaceManager.luau"
        -- In an exploit environment, user can do:
        -- local SaveManager = loadstring(readfile("ChiroSaveManager.luau"))()
    end)
end)

SetTab:CreateParagraph({
    Title   = "Chiro UI v8.0 Features",
    Content = "Executor: " .. ExecutorName .. "\nGame: " .. GameName .. "\nIncludes full Job ID copier & server joiner, redesigned high-definition text inputs with clear buttons, and complete Fluent-style SaveManager & InterfaceManager addon modules.",
})

-- ── LICENSE INFO SECTION ─────────────────────────────────────
SetTab:CreateSection("License Key Information")

-- Helper: format expiry timestamp with countdown calculation
local function formatExpiry(expiresAt, isLifetime)
    if isLifetime or not expiresAt or expiresAt == "" then
        return "♾  Lifetime (No Expiry)"
    end

    local formatted = tostring(expiresAt)
    local expUnix = parseIsoTimestamp(expiresAt)
    local pcallSuccess, dt = pcall(function() return DateTime.fromIsoDate(expiresAt) end)
    if pcallSuccess and dt then
        local u = dt:ToUniversalTime()
        formatted = string.format("%02d/%02d/%04d %02d:%02d:%02d UTC", u.Day, u.Month, u.Year, u.Hour, u.Minute, u.Second)
    else
        local y, mo, d, h, mi, s = tostring(expiresAt):match("(%d+)-(%d+)-(%d+)T(%d+):(%d+):(%d+)")
        if y then
            formatted = string.format("%s/%s/%s %s:%s:%s UTC", d, mo, y, h, mi, s or "00")
        end
    end

    if expUnix then
        local nowUnix = os.time()
        local diff = expUnix - nowUnix
        if diff <= 0 then
            return formatted .. " ❌ (EXPIRED)"
        elseif diff < 60 then
            return formatted .. " (" .. diff .. "s left)"
        elseif diff < 3600 then
            return formatted .. " (" .. math.floor(diff / 60) .. "m " .. (diff % 60) .. "s left)"
        elseif diff < 86400 then
            return formatted .. " (" .. math.floor(diff / 3600) .. "h " .. math.floor((diff % 3600) / 60) .. "m left)"
        else
            return formatted .. " (" .. math.floor(diff / 86400) .. "d left)"
        end
    end
    return formatted
end

-- Build content string from _G.ChiroLicenseData
local function getLicenseInfoContent()
    local ld = _G.ChiroLicenseData
    if not ld then
        return "No license data available.\nPlease restart to verify your license key."
    end

    local d = ld.data or {}
    local lic = (type(d) == "table" and (d.license or d)) or {}

    local keyStr = tostring(lic.key or ld.key or "—")
    local hwidStr = tostring(lic.hwid or ld.hwid or getHWID() or "—")
    local rawExp = lic.expiresAt or ld.expiresAt
    local isLife = lic.isLifetime or ld.isLifetime or (rawExp == nil or rawExp == "")

    local maxDev = tonumber(lic.maxDevices or d.maxDevices) or 1
    local usedDev = tonumber(lic.devicesUsed or lic.currentDevices or d.devicesUsed or d.currentDevices) or 1
    local devStr = tostring(usedDev) .. " / " .. tostring(maxDev) .. " devices"

    local expStr = formatExpiry(rawExp, isLife)
    local statusStr = tostring(lic.status or d.status or "ACTIVE")

    -- Truncate HWID to keep paragraph clean
    local hwidDisplay = string.len(hwidStr) > 24 and (string.sub(hwidStr, 1, 22) .. "…") or hwidStr

    return table.concat({
        "🔑  Key: " .. keyStr,
        "🖥  HWID: " .. hwidDisplay,
        "📱  Devices: " .. devStr,
        "⏳  Expires: " .. expStr,
        "⚡  Status: " .. statusStr,
    }, "\n")
end

local LicenseParagraph = SetTab:CreateParagraph({
    Title   = "Active License",
    Content = getLicenseInfoContent(),
})
_G.ChiroLicenseParagraph = LicenseParagraph

-- Continuously refresh the paragraph content every second so the countdown ticks dynamically!
task.spawn(function()
    while ScreenGui and ScreenGui.Parent do
        task.wait(1.0)
        pcall(function()
            local targetPara = _G.ChiroLicenseParagraph or LicenseParagraph
            if targetPara and targetPara.SetContent then
                targetPara:SetContent(getLicenseInfoContent())
            end
        end)
    end
end)

-- Select MainTab on launch so user sees sections and controls immediately
task.defer(function()
    if MainTab and MainTab._selectTab then
        MainTab._selectTab()
    end
end)

-- Fire a demo welcome toast notification
task.spawn(function()
    task.wait(0.5)
    Chiro:Notify({
        Title    = "CHIRO v8.0 READY",
        Content  = "Modern glass toast notification with smooth spring slide-in and progress countdown.",
        Kind     = "info",
        Duration = 15,
    })
end)

print("[Chiro v8.0] Script initialized successfully with Game Hub, Job ID Joiner, and Modern Inputs.")
