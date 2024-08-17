-- Load the UI library
loadstring(game:HttpGet("https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/UI.lua"))()

-- Create the main window for the hub
MakeWindow({
    Hub = {
        Title = "Xervice HUB",
        Animation = "By : Sofia1stCute4 🍉"
    },
    Key = {
        KeySystem = false,
        Title = "Xervice HUB",
        Description = "",
        KeyLink = "https://sub4unlock.io/1kPsC",
        Keys = {"ImAloneToT"},
        Notifi = {
            Notifications = true,
            CorrectKey = "Key is Correct, wait...",
            IncorrectKey = "The key is incorrect",
            CopyKeyLink = "Copied to Clipboard"
        }
    }
})

-- Configure the minimize button
MinimizeButton({
    Image = "rbxassetid://18982309971",
    Size = {55, 55},
    Color = Color3.fromRGB(10, 10, 10),
    Corner = true,
    Stroke = false,
    StrokeColor = Color3.fromRGB(255, 0, 0)
})

-- Create and configure the Classic Mode tab
local classicModeTab = MakeTab({Name = "Classic Mode"})
local classicSection = AddSection(classicModeTab, {"Teste"})
SetSection(classicSection, "Chapter 2")
AddButton(classicModeTab, {
    Name = "Part 2",
    Callback = function()
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            player.Character.HumanoidRootPart.CFrame = CFrame.new(232.6605987548828, 100.84130096435547, -595.3074951171875)
        end
    end
})

-- Create and configure the Settings tab
local settingsTab = MakeTab({Name = "Setting"})

-- Fullbright Setting
local fullbrightSection = AddSection(settingsTab, {"Teste"})
SetSection(fullbrightSection, "Fullbright")
AddButton(settingsTab, {
    Name = "Fullbright",
    Callback = function()
        spawn(function()
            local lighting = game.Lighting
            local colorCorrection = Instance.new("ColorCorrectionEffect")
            colorCorrection.Name = "ColorCorrection"
            colorCorrection.Brightness = 0.2
            colorCorrection.Contrast = 0
            colorCorrection.TintColor = Color3.new(1, 1, 1)
            colorCorrection.Parent = lighting
            lighting.ClockTime = 12
            lighting.Ambient = Color3.new(1, 1, 1)
            lighting.Brightness = 10
            colorCorrection.Enabled = true
        end)
    end
})

-- Miscellaneous Settings
local miscSection = AddSection(settingsTab, {"Teste"})
SetSection(miscSection, "Misc")

-- Infinite Yield Button
AddButton(settingsTab, {
    Name = "Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

-- Fly Button
AddButton(settingsTab, {
    Name = "Fly",
    Callback = function()
        -- Replace with the actual Fly script URL
        loadstring(game:HttpGet('https://raw.githubusercontent.com/MerryXTrash/MerryXTrash2/main/FlyScript.lua'))()
    end
})

-- Rejoin Button
AddButton(settingsTab, {
    Name = "Rejoin - Press if You Die",
    Callback = function()
        local teleportService = game:GetService("TeleportService")
        local players = game:GetService("Players")
        local localPlayer = players.LocalPlayer

        local rejoin = coroutine.create(function()
            local success, errorMessage = pcall(function()
                teleportService:Teleport(game.PlaceId, localPlayer)
            end)

            if not success and errorMessage then
                warn(errorMessage)
            end
        end)

        coroutine.resume(rejoin)
    end
})
