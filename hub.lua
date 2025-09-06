-- Super Hub (hub.lua)
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Super hub",
   Icon = 819984361,
   LoadingTitle = "Super hub",
   LoadingSubtitle = "by supan",
   ShowText = "Super Hub",
   Theme = "Ocean",

   ToggleUIKeybind = "K",

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false,

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil,
      FileName = "Super hub"
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

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

-- ✅ helper for script execution with notifications
local function runScript(url, name)
   local success, err = pcall(function()
      local code = game:HttpGet(url)
      loadstring(code)()
   end)

   if success then
      Rayfield:Notify({
         Title = "Loaded!",
         Content = name .. " executed successfully.",
         Duration = 6.5,
         Image = "check"
      })
   else
      Rayfield:Notify({
         Title = "Error!",
         Content = "Failed to load " .. name .. ": " .. tostring(err),
         Duration = 6.5,
         Image = "alert-triangle"
      })
   end
end

-- 📌 Tab 1: Fly GUI
local Tab = Window:CreateTab("Scripts")
local Section = Tab:CreateSection("Fly GUI")

Section:CreateButton({
   Name = "Open Fly GUI",
   Callback = function()
      local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
      if playerGui:FindFirstChild("FlyGUI") then return end

      local screenGui = Instance.new("ScreenGui")
      screenGui.Name = "FlyGUI"
      screenGui.ResetOnSpawn = false
      screenGui.Parent = playerGui

      local frame = Instance.new("Frame")
      frame.Size = UDim2.new(0, 200, 0, 120)
      frame.Position = UDim2.new(0.5, -100, 0.5, -60)
      frame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
      frame.Parent = screenGui

      local speedBox = Instance.new("TextBox")
      speedBox.Size = UDim2.new(0, 180, 0, 30)
      speedBox.Position = UDim2.new(0, 10, 0, 10)
      speedBox.PlaceholderText = "Enter speed"
      speedBox.Text = ""
      speedBox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
      speedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
      speedBox.Parent = frame

      local flyButton = Instance.new("TextButton")
      flyButton.Size = UDim2.new(0, 180, 0, 40)
      flyButton.Position = UDim2.new(0, 10, 0, 50)
      flyButton.Text = "Fly"
      flyButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
      flyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
      flyButton.Parent = frame

      flyButton.MouseButton1Click:Connect(function()
         Rayfield:Notify({
            Title = "Fly Enabled",
            Content = "Speed set to: " .. (speedBox.Text ~= "" and speedBox.Text or "Default"),
            Duration = 6.5,
            Image = "zap"
         })
      end)
   end
})

-- 📌 Tab 2: Script Hubs
local NameTab = Window:CreateTab("Hubs I found in scriptblox")
local NameSection = NameTab:CreateSection("Main Section")

NameSection:CreateButton({
   Name = "NDS Hub",
   Callback = function()
      runScript("https://raw.githubusercontent.com/KaterHub-Inc/NaturalDisasterSurvival/refs/heads/main/main.lua", "NDS Hub")
   end
})

NameSection:CreateButton({
   Name = "Nullfire",
   Callback = function()
      runScript("https://raw.githubusercontent.com/InfernusScripts/Null-Fire/main/Loader", "Nullfire")
   end
})

NameSection:CreateButton({
   Name = "script I found",
   Callback = function()
      runScript("https://pastebin.com/raw/ZitGXpMK", "Random Script")
   end
})

NameSection:CreateButton({
   Name = "I was here (needs key)",
   Callback = function()
      runScript("https://raw.githubusercontent.com/Bac0nh1ck/Scripts/main/NDS_A%5EX", "I Was Here")
   end
})

-- 📌 Welcome notification
Rayfield:Notify({
   Title = "Super Hub",
   Content = "Welcome! Use the tabs to load scripts.",
   Duration = 6.5,
   Image = "smile"
})
