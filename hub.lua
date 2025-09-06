-- Rayfield Window
local Window = Rayfield:CreateWindow({
   Name = "Super Hub",
   Icon = 819984361,
   LoadingTitle = "Super Hub",
   LoadingSubtitle = "by supan",
   ShowText = "Super Hub",
   Theme = "Ocean",
   ToggleUIKeybind = "K",
   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,
   ConfigurationSaving = { Enabled = true, FolderName = nil, FileName = "Super Hub" },
   Discord = { Enabled = false },
   KeySystem = true,
   KeySettings = {
      Title = "Super Hub Key",
      Subtitle = "Key is LETMEINDUDE",
      Note = "I ain't letting you in-",
      FileName = "Key",
      SaveKey = true,
      GrabKeyFromSite = false,
      Key = {"LETMEINDUDE"}
   }
})

-------------------------
-- Tabs
local ScriptsTab = Window:CreateTab("Scripts")
local UniversalTab = Window:CreateTab("Universal")
local TrollingTab = Window:CreateTab("Trolling")
local ExtraTab = Window:CreateTab("Extra")      -- previously GamesTab
local MiscTab = Window:CreateTab("Misc")        -- previously ExtraTab

-------------------------
-- Universal Tab Section
local UniSection = UniversalTab:CreateSection("Main")

-- Seraphic Blade
UniSection:CreateButton({
    Name = "Seraphic Blade R6 Only",
    Callback = function()
        pcall(function()
            local code = game:HttpGet("https://pastefy.app/59mJGQGe/raw")
            loadstring(code)()
        end)
    end
})

-- Not Stream Sniper but a Hub
UniSection:CreateButton({
    Name = "Not Stream Sniper but a Hub",
    Callback = function()
        pcall(function()
            local code = game:HttpGet("https://raw.githubusercontent.com/scripthubekitten/SCRIPTHUBV3/main/SCRIPTHUBV3")
            loadstring(code)()
        end)
    end
})

-- Nameless Admin
UniSection:CreateButton({
    Name = "Nameless Admin",
    Callback = function()
        pcall(function()
            local code = game:HttpGet("https://rawscripts.net/raw/Universal-Script-nameless-admin-so-good-38584")
            loadstring(code)()
        end)
    end
})

-------------------------
-- Trolling Tab Section
local TrollSection = TrollingTab:CreateSection("Trolling")

-- Snail
TrollSection:CreateButton({
    Name = "Snail",
    Callback = function()
        _G.Snail_Config = {Speed = 0.4, TunnelSpeed = 2}
        if _G.Snail_Ran then return end
        loadstring(game:HttpGet('https://raw.githubusercontent.com/MastersMZ-Scripts/Scripts/master/Snail%20Script/Snail%20Script%20V2.lua'))()
    end
})

-- Fling All
local flingAllEnabled = false
TrollSection:CreateButton({
    Name = "Fling All",
    Callback = function()
        if flingAllEnabled then return end
        flingAllEnabled = true
        Rayfield:Notify({Title="Fling All", Content="Flinging everyone...", Duration=6.5, Image="zap"})
        task.spawn(function()
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local LocalChar = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local LocalHRP = LocalChar:WaitForChild("HumanoidRootPart")
            while flingAllEnabled do
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        local TargetHRP = player.Character.HumanoidRootPart
                        LocalHRP.CFrame = TargetHRP.CFrame * CFrame.new(0,0,1)
                        LocalHRP.Velocity = Vector3.new(9999,9999,9999)
                        task.wait(0.1)
                    end
                end
                task.wait(0.5)
            end
        end)
    end
})
TrollSection:CreateButton({
    Name = "Stop Fling All",
    Callback = function()
        flingAllEnabled = false
        Rayfield:Notify({Title="Fling All", Content="Stopped flinging everyone", Duration=5, Image="square"})
    end
})

-- Super Ring Parts
getgenv().SuperRingRunning = false
TrollSection:CreateButton({
    Name = "Super Ring Parts",
    Callback = function()
        if getgenv().SuperRingRunning then return end
        getgenv().SuperRingRunning = true
        Rayfield:Notify({Title="Super Ring Parts", Content="Spinning unanchored blocks", Duration=6.5, Image="rotate-cw"})
        local Players = game:GetService("Players")
        local LocalPlayer = Players.LocalPlayer
        local Char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
        local HRP = Char:WaitForChild("HumanoidRootPart")
        local Radius, Speed, Rings, HeightGap = 20, 5, 3, 5
        task.spawn(function()
            while getgenv().SuperRingRunning and task.wait() do
                local t = tick() * Speed
                for _, part in ipairs(workspace:GetChildren()) do
                    if part:IsA("BasePart") and not part.Anchored then
                        for r = 1, Rings do
                            local angle = (t + part:GetDebugId()) % (2*math.pi)
                            local x = math.cos(angle)*Radius
                            local z = math.sin(angle)*Radius
                            local y = HRP.Position.Y + (r-1)*HeightGap
                            part.CFrame = CFrame.new(HRP.Position.X + x, y, HRP.Position.Z + z)
                        end
                    end
                end
            end
        end)
    end
})
TrollSection:CreateButton({
    Name = "Stop Super Ring Parts",
    Callback = function()
        getgenv().SuperRingRunning = false
        Rayfield:Notify({Title="Super Ring Parts", Content="Stopped spinning blocks", Duration=5, Image="square"})
    end
})

-- John Doe R6 Fling
TrollSection:CreateButton({
    Name = "Enable John Doe but with fling and FE R6",
    Callback = function()
        pcall(function()
            local code = game:HttpGet("https://pastebin.com/raw/sB9Wwx9v")
            loadstring(code)()
        end)
    end
})

-------------------------
-- Extra Tab Section
local ExtraSection = ExtraTab:CreateSection("Extra Features")

-- Server Hop
ExtraSection:CreateButton({
    Name = "Server Hop",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        local success, servers = pcall(function()
            return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
        end)
        if success and servers and servers.data then
            for _, server in pairs(servers.data) do
                if server.playing < server.maxPlayers then
                    TeleportService:TeleportToPlaceInstance(PlaceId, server.id, game.Players.LocalPlayer)
                    break
                end
            end
        end
    end
})

-- FullBright Toggle
local fullBrightEnabled = false
ExtraSection:CreateToggle({
    Name = "FullBright",
    CurrentValue = false,
    Flag = "FullBrightToggle",
    Callback = function(value)
        fullBrightEnabled = value
        local Lighting = game:GetService("Lighting")
        if fullBrightEnabled then
            Lighting.Ambient = Color3.new(1,1,1)
            Lighting.Brightness = 2
        else
            Lighting.Ambient = Color3.new(0.5,0.5,0.5)
            Lighting.Brightness = 1
        end
    end
})

-- Auto Respawn Toggle
local autoRespawnEnabled = false
ExtraSection:CreateToggle({
    Name = "Auto Respawn",
    CurrentValue = false,
    Flag = "AutoRespawnToggle",
    Callback = function(value)
        autoRespawnEnabled = value
        local player = game.Players.LocalPlayer
        player.CharacterAdded:Connect(function(char)
            if autoRespawnEnabled then
                player:LoadCharacter()
            end
        end)
    end
})

-- ESP Toggle
local espEnabled = false
ExtraSection:CreateToggle({
    Name = "ESP",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(value)
        espEnabled = value
        for _, player in pairs(game.Players:GetPlayers()) do
            if player ~= game.Players.LocalPlayer and player.Character then
                if espEnabled then
                    local box = Instance.new("BoxHandleAdornment")
                    box.Adornee = player.Character:FindFirstChild("HumanoidRootPart")
                    box.Size = Vector3.new(2,5,1)
                    box.Color3 = Color3.fromRGB(255,0,0)
                    box.AlwaysOnTop = true
                    box.Parent = player.Character
                else
                    local adorns = player.Character:GetChildren()
                    for _, a in pairs(adorns) do
                        if a:IsA("BoxHandleAdornment") then
                            a:Destroy()
                        end
                    end
                end
            end
        end
    end
})

-------------------------
-- Misc Tab Section
local MiscSection = MiscTab:CreateSection("Misc Settings")

-- WalkSpeed Slider
MiscSection:CreateSlider({
    Name = "WalkSpeed",
    Range = {16,200},
    Increment = 1,
    Suffix = " studs/sec",
    CurrentValue = 16,
    Flag = "WalkSpeedSlider",
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.WalkSpeed = value
        end
    end
})

-- JumpPower Slider
MiscSection:CreateSlider({
    Name = "JumpPower",
    Range = {50,500},
    Increment = 1,
    Suffix = " studs",
    CurrentValue = 50,
    Flag = "JumpPowerSlider",
    Callback = function(value)
        local player = game.Players.LocalPlayer
        if player.Character and player.Character:FindFirstChild("Humanoid") then
            player.Character.Humanoid.JumpPower = value
        end
    end
})

-- NoClip Toggle
local noclipEnabled = false
MiscSection:CreateToggle({
    Name = "NoClip",
    CurrentValue = false,
    Flag = "NoClipToggle",
    Callback = function(value)
        noclipEnabled = value
        local player = game.Players.LocalPlayer
        local char = player.Character
        if char then
            task.spawn(function()
                while noclipEnabled do
                    for _, part in pairs(char:GetChildren()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                    task.wait()
                end
            end)
        end
    end
})

-- Reset Character Button
MiscSection:CreateButton({
    Name = "Reset Character",
    Callback = function()
        local player = game.Players.LocalPlayer
        player:LoadCharacter()
        Rayfield:Notify({Title="Misc", Content="Character Reset!", Duration=4, Image="refresh-cw"})
    end
})

-- Rejoin Button
MiscSection:CreateButton({
    Name = "Rejoin",
    Callback = function()
        local TeleportService = game:GetService("TeleportService")
        local PlaceId = game.PlaceId
        local player = game.Players.LocalPlayer
        TeleportService:Teleport(PlaceId, player)
    end
})
