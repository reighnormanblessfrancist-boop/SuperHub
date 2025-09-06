-- Extra Tab Section
local ExtraSection = ExtraTab:CreateSection("Extra Features")

-- Server Hop Button
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

-- ESP Toggle (Simple example)
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
