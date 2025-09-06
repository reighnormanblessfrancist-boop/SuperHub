-- Auto Rayfield + Super Hub GUI Loader
pcall(function()
    -- Load Rayfield if not loaded
    if not Rayfield then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LinusKehlet/Rayfield/main/Rayfield.lua"))()
    end

    -- Wait until Rayfield initializes
    repeat task.wait() until Rayfield

    -- Create a small GUI with a "Load Super Hub" button
    local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "SuperHubLoaderGUI"
    screenGui.ResetOnSpawn = false
    screenGui.Parent = playerGui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 80)
    frame.Position = UDim2.new(0.5, -100, 0.5, -40)
    frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    frame.Parent = screenGui

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 50)
    button.Position = UDim2.new(
            
