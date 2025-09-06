-- Super Hub Delta Loader
pcall(function()
    local url = "https://raw.githubusercontent.com/reighnormanblessfrancist-boop/SuperHub/main/SuperHub.lua" -- raw GitHub link
    local code = game:HttpGet(url)
    loadstring(code)()

    -- Successful load notification
    if Rayfield then
        Rayfield:Notify({
            Title = "Super Hub by supan",
            Content = "thank u for choosing this rayfield script",
            Duration = 10,
            Image = "thanks"
        })
    end
end)

-- Failed load notification
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
