-- Auto Rayfield + Super Hub Loader
pcall(function()
    -- Load Rayfield automatically if not loaded
    if not Rayfield then
        loadstring(game:HttpGet("https://raw.githubusercontent.com/LinusKehlet/Rayfield/main/Rayfield.lua"))()
    end

    -- Small wait to make sure Rayfield initializes
    repeat task.wait() until Rayfield

    -- Load Super Hub from GitHub
    local url = "https://raw.githubusercontent.com/reighnormanblessfrancist-boop/SuperHub/main/SuperHub.lua"
    local code = game:HttpGet(url)
    loadstring(code)()

    -- Success notification
    if Rayfield then
        Rayfield:Notify({
            Title = "Super Hub by supan",
            Content = "thank u for choosing this rayfield script",
            Duration = 10,
            Image = "thanks"
        })
    end
end)

-- Failure notification if something goes wrong
pcall(function()
    local success = pcall(function() game:HttpGet("https://raw.githubusercontent.com/reighnormanblessfrancist-boop/SuperHub/main/SuperHub.lua") end)
    if not success and Rayfield then
        Rayfield:Notify({
            Title = "Super Hub by supan",
            Content = "mail: you freaking failer",
            Duration = 5,
            Image = "bruh"
        })
    end
end)
